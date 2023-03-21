
import datetime
from unittest import result
from django.utils import timezone
import json
from django.forms import models
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from app.models import AbnFeature, AdminToken, Category, ClientDemand, Feedback, Label, MyFiles, Parrain, Retrait, SellerAccount, SubCategory, User, UserGame, WeekCustom, ZawadiDetail, Client, checking_token, get_alertwha_message, get_market_client_message, get_market_seller_message, get_value, get_welcome_message, ident_generator, send_messages, send_whatsapp_notif
from django.contrib.auth import login, authenticate, logout
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django.db import transaction
from rest_framework.permissions import IsAuthenticated
from app.views import get_obj_from_paginator, send_by_thread
from .serializers import *
from appv2.models import Demand, Remboursement
from app.core import Kkiapay
from django.db.models import Count, Max, Min
import threading
from rest_framework import serializers
from firebase_admin.messaging import Message as Mss, Notification, AndroidNotification, WebpushConfig, WebpushFCMOptions, AndroidConfig, APNSConfig, APNSPayload, Aps
from fcm_django.models import FCMDevice
from django.core.paginator import Paginator
from .algorithm import get_ordered_subs
from .new_algo import build_discussions, find_good_dis
import subprocess
from django.http import HttpResponse
import os
from django.views.decorators.csrf import csrf_exempt
import requests

SANDBOX = False

def order_subs(sps, quart) :
    myl = [
        {'sp' : sp, 'dis' : sp.seller_s.seller.get_distance(quart)} for sp in sps
    ]
    myl.sort(key = lambda e : e['dis'])
    return [
        e['sp'] for e in myl
    ]

@api_view(["GET"])
def get_new_demands(request) :
    try :
        p = request.GET.get('p')
    except :
        p = 1
    email = request.GET.get('email')
    dems = Demand.objects.filter(client__user__email = f'client{email}').order_by("-created_at")
    obj_list = get_obj_from_paginator(dems, 16, p, DemandSerializer)
    return Response(obj_list)


def pay(request, token) :
    adtok = AdminToken.objects.get(token = token)
    dis = Discussion.objects.get(pk = int(adtok.name.split("-")[1].split(":")[1]))
    transaction_id = request.GET.get('transaction_id')
    if transaction_id :
        k = Kkiapay((get_value('kkiapay_public') if not SANDBOX else get_value('kkiapay_public_sand')), (get_value('kkiapay_private') if not SANDBOX else get_value('kkiapay_private_sand')), (get_value('kkiapay_secret') if not SANDBOX else get_value('kkiapay_secret_sand')), sandbox= SANDBOX)
        trans = k.verify_transaction(transaction_id=transaction_id)
        status = trans.status == "SUCCESS"
        if status :
            dis.demand.payment = dis.amount
            dis.demand.state = "En attente de satisfaction"
            dis.demand.save()
            clpay = ClientPayment.objects.create(client = dis.demand.client, demand = dis.demand, transaction_id = transaction_id)
            dis.payment = clpay
            dis.save()
            return redirect('/v2/pay_success/' + token + '/')
    if dis.demand.payment :
        return redirect('/v2/pay_success/' + token + '/')
    else : return render(request, 'appv2/pay.html', {
        'dis' : dis,
        'token' : token,
        'sandbox': SANDBOX,
        'pay_token': (get_value('kkiapay_public') if not SANDBOX else get_value('kkiapay_public_sand')),
        'pay_serv' : get_value('pay_serv')
    })


def pay_success(request, token) :
    adtok = AdminToken.objects.get(token = token)
    dis = Discussion.objects.get(pk = int(adtok.name.split("-")[1].split(":")[1]))
    return render(request, 'appv2/pay_success.html', {
        'dis' : dis,
        'transaction_id' : dis.payment.transaction_id,
        'pay_token': ZawadiDetail.objects.get(key='kkiapay_public').value,
        'pay_serv' : get_value('pay_serv')
    })

@transaction.atomic
@api_view(["POST"])
def set_satisfied(request, pk) :
    email = request.GET.get('email')
    demand = Demand.objects.filter(pk = pk, client__user__email = f'client{email}', unique_id = request.data.get('key'))
    if demand.exists() :
        demand = demand.first()
        demand.satisfied = True
        demand.state = "Satisfaite"
        demand.save()
        dis = demand.discussions.filter(statut = "En cours").first()
        dis.statut = "Finalisé"
        dis.save()
        for prod in dis.sold.all() :
            prod.is_sold = True
            prod.sold_date = datetime.datetime.today()
            prod.save()
        plans = dis.payment_plan.split('-')
        for plan in plans :
            elts = plan.split(':')
            if elts[0] == 'zwd' :
                det = ZawadiDetail.objects.get_or_create(key="zwd_pay")
                if det[1] :
                    det[0].value = f"{elts[1]}"
                    det[0].save()
                else :
                    det = det[0]
                    det.value += f"+{elts[1]}"
                    det.save()
            if elts[0] == 'patner' :
                patner = Patner.objects.get(pk = dis.rpatner)
                ptnrpay = PatnerPay.objects.create(montant = int(float(elts[1])), type_of = "Paiement", transaction_id = f"5P13M{dis.payment.transaction_id}", patner = patner, dis = dis)
                ptnrpay.save()
            if elts[0] == 'seller' :
                seller = SellerState.objects.get(pk = int(elts[1]) )
                slrpay = SellerPay.objects.create(montant = int(float(elts[2])) * float(get_value('seller_percentage')), type_of = "Paiement", transaction_id = f"5S13M{dis.payment.transaction_id}", seller_s = seller, dis = dis)
                slrpay.save()
        return Response({
            'done' : True,
            'result' : 0
        })
    return Response({
        'done' : False,
    })

@api_view(["GET"])
def set_rembour(request, pk) :
    email = request.GET.get('email')
    demand = Demand.objects.filter(pk = pk, client__user__email = f'client{email}')
    if demand.exists() :
        demand = demand.first()
        dis = demand.discussions.filter(statut = "En cours").first()
        rembour = Remboursement.objects.get_or_create(demand = demand, clientpay = dis.payment)
        
        return Response({
            'done' : True,
            'result' : 0
        })
    return Response({
        "done" : False
    })

@api_view(["GET"])
def delete_dem(request, pk) :
    email = request.GET.get('email')
    demand = Demand.objects.filter(pk = pk, client__user__email = f'client{email}')
    if demand.exists() :
        demand.delete()
    return Response({
        'done' : True,
        'result' : 0
    })

@api_view(["GET"])
def get_tree_cats(request) :
    labels = Label.objects.all()
    return Response({
        'done' : True,
        'result' : LabelSerializer(labels, many = True).data
    })

@api_view(["POST"])
def register_demand(request) :
    email = request.POST.get('email')
    first_name = request.POST.get('first_name')
    last_name = request.POST.get('last_name')
    phone = request.POST.get('phone')
    whatsapp = request.POST.get('whatsapp')
    quart = request.POST.get('quart')
    subs = int(request.POST.get('subs'))
    ssubs = int(request.POST.get('ssubs'))
    num = int(request.POST.get('num'))
    bdg = int(request.POST.get('bdg'))
    if not whatsapp :
        return Response({
            'done' : False
        }) 
    user = User.objects.get_or_create(email = f'client{email}')[0]
    user.set_password(first_name + last_name + email)
    user.first_name = first_name
    user.last_name = last_name
    user.quart = quart
    user.save()
    client = Client.objects.get_or_create(user = user)[0]
    client.whatsapp = whatsapp
    client.phone = phone
    client.save()
    subs = SubCategory.objects.get(pk = (ssubs if ssubs else subs))
    demand = Demand.objects.create(client = client, subs = subs, bdg = bdg, num = num, unique_id = ident_generator(5, 8))
    def send_dem() :
        build_discussions(demand)
    send_by_thread(send_dem)
    return Response({
        'done' : True,
        'result' : demand.pk
    })

@api_view(["POST"])
def authenticate_seller(request) :
    email = request.POST.get('email')
    seller = SellerState.objects.filter(seller__user__email = email)
    return Response({
        'done' : seller.exists(),
        'result' : 0
    })

@api_view(["GET"])
def get_payments(request) :
    email = request.GET.get('email')
    cpays = ClientPayment.objects.filter(client__user__email = f'client{email}').order_by('-created_at')
    return Response({
        'done' : True,
        'result' : ClientPaySerializer(cpays, many = True).data
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def ping(request) :
    return Response({
        'done' : True
    })

@api_view(["POST"])
def register_seller(request) :
    email = request.POST.get('email')
    first_name = request.POST.get('first_name')
    last_name = request.POST.get('last_name')
    whatsapp = request.POST.get('whtasapp')
    quart = request.POST.get('quart')
    password = request.POST.get('password')
    commerce = request.POST.get('commerce')
    seller = SellerState.objects.filter(seller_user__email = email)
    if seller.exists() :
        return Response({
            'done' : False,
            'result' : 1
        })
    user = User.objects.get_or_create(email = email)[0]
    user.first_name = first_name
    user.last_name = last_name
    user.set_password(password)
    user.quart = quart
    user.save()
    seller = SellerAccount.objects.get_or_create(user = user)[0]
    seller.name = commerce
    seller.format_number = whatsapp
    seller.whatsapp = whatsapp
    seller.save()
    seller_s = SellerState.objects.create(seller = seller)
    return Response({
        'done' : True,
        'result' : 0
    })


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_seller_state(request) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    return Response({
        'done' : True,
        'result' : SellerStateSerializer(seller_s).data
    })


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_sparams(request) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    return Response({
        'done' : True,
        'result' : {
            'name' : seller_s.seller.name,
            'p_count' : seller_s.p_count(),
            'picture' : seller_s.get_picture(),
            'momos' : MoMOSerializer(seller_s.momos.all(), many = True).data,
            'cur_momo' : seller_s.current_momo,
            'info' : {
                'first_name' : seller_s.seller.user.first_name,
                'last_name' : seller_s.seller.user.last_name,
                'email' : seller_s.seller.user.email,
                'quart' : seller_s.seller.user.quart,
                'commerce' : seller_s.seller.name,
                'whatsapp' : seller_s.seller.format_number
            }
        }
    })


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def set_spicture(request) : 
    seller_s = SellerState.objects.get(seller__user = request.user)
    seller_s.seller.picture = request.FILES.get('picture')
    seller_s.seller.save()
    return Response({
        'done' : True,
        'result' : SellerState.objects.get(seller__user = request.user).get_picture()
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def check_password(request) :
    password = request.POST.get('password')
    if request.user.check_password(password) :
        adtok = AdminToken.objects.create(name = f"password:{request.user.pk}", token = ident_generator(50, 100))
        return Response({
            'done' : True,
            'result' : adtok.token
        })
    return Response({
        'done' : False
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def update_info(request) :
    token = request.POST.get('token')
    first_name = request.POST.get('first_name')
    last_name = request.POST.get('last_name')
    commerce = request.POST.get('commerce')
    email = request.POST.get('email')
    whatsapp = request.POST.get('whatsapp')
    quart = request.POST.get('quart')
    adtok = AdminToken.objects.get(token = token)
    if int(adtok.name.split(':')[1]) == request.user.pk :
        us = request.user
        us.first_name = first_name
        us.last_name = last_name
        us.email = email
        us.quart = quart
        us.save()
        seller = SellerAccount.objects.get(user = us)
        seller.name = commerce 
        seller.format_number = whatsapp
        seller.whatsapp = whatsapp
        seller.save()
        return Response({
            'done' : True,
            'result' : 0
        })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def update_password(request) :
    token = request.POST.get('token')
    ww_w = request.POST.get('ww_w')
    adtok = AdminToken.objects.get(token = token)
    if int(adtok.name.split(':')[1]) == request.user.pk :
        us = request.user
        us.set_password(ww_w)
        us.save()
        return Response({
            'done' : True,
            'result' : 0
        })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def set_momo(request) :
    for_ = request.GET.get('for')
    id = request.POST.get('id')
    momo = MoMoCompte.objects.get(pk = int(id))
    target = SellerState.objects.get(seller__user = request.user) if not for_ else Patner.objects.get(user = request.user)
    if momo in target.momos.all() :
        target.current_momo = momo.pk
        target.save()
    return Response({
        'done' : True,
        'result' : 0
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def upload_img(request) :
    file = request.data.get('file')
    seller_s = SellerState.objects.get(seller__user = request.user)
    myfile = MyFiles.objects.create(name = f"seller:{seller_s.pk}", file = file)
    return Response({
        'done' : True,
        'result' : myfile.pk,
        'url' : myfile.get_file()
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def pupload_img(request) :
    file = request.data.get('file')
    patner = Patner.objects.get(user = request.user)
    myfile = MyFiles.objects.create(name = f"patner:{patner.pk}", file = file)
    return Response({
        'done' : True,
        'result' : myfile.pk,
        'url' : myfile.get_file()
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def create_momo(request) :
    for_ = request.GET.get('for')
    target = SellerState.objects.get(seller__user = request.user) if not for_ else Patner.objects.get(user = request.user)
    name = request.POST.get('name')
    number = request.POST.get('number')
    file = request.POST.get('file')
    momo = MoMoCompte.objects.create(name = name, number = number, piece = MyFiles.objects.get(pk = int(file)))
    target.momos.add(momo)
    target.current_momo = momo.pk
    target.save()
    return Response({
        'done' : True,
        'result' : 0
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_spays(request) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    spays = SellerPay.objects.filter(seller_s = seller_s).order_by('-created_at')
    return Response({
        'done' : True,
        'result' : {
            'total_solde' : seller_s.total_solde,
            'solde' : seller_s.solde,
            'p_count' : seller_s.p_count(),
            'pays' : SellerPaySerializer(spays, many = True).data,
            'call_num' : get_value('service:payement'),
            'has_retr' : seller_s.has_retr()
        }
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def encaisser(request) :
    for_ = request.POST.get('for')
    if for_ == 'patner' :
        patner = Patner.objects.get(user = request.user)
        pay = PatnerPay.objects.create(montant = patner.solde, type_of = 'Retrait', patner = patner )
        pay.transaction_id = f"zwd__ptnr13M1325{pay.pk}"
    else :
        seller_s = SellerState.objects.get(seller__user = request.user)
        pay = SellerPay.objects.create(montant = seller_s.solde, type_of = "Retrait", seller_s = seller_s)
        pay.transaction_id = f"zwd_slr12MP12{pay.pk}"
        pay.save()
    return Response({
        'done' : True
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def sub_prod(request, id) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    sp = SubProduct.objects.get(pk = id, seller_s = seller_s)
    return Response({
        'done' : True,
        'result' : SubProductSerializer(sp).data
    })


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def prods_mm(request, id) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    sp = SubProduct.objects.get(pk = id, seller_s = seller_s )
    min = request.data.get('min')
    max = request.data.get('max')
    prods = sp.products.filter(is_sold = False, min_p = int(min), max_p = int(max))
    return Response({
        'done' : True,
        'result' : ProductSerializer(prods, many = True).data
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def delete_th(request) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    dels = json.loads(request.data.get('lis'))
    prods = []
    for elt in dels :
        if 'file' in elt :
            mfile = MyFiles.objects.get(pk = int(elt.split(':')[1]), name = f"seller:{seller_s.pk}")
            prods.append(mfile.products.all().first())
            mfile.delete()
    for prod in prods :
        if not prod.files.count() : prod.delete()
    return Response({
        'done' : True,
        'result' : 0
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def create_prod(request) :
    name = request.POST.get('name')
    details = request.POST.get('details')
    min = request.POST.get('min')
    max = request.POST.get('max')
    files = json.loads(request.POST.get('files'))
    subp = request.POST.get('subp')
    seller_s = SellerState.objects.get(seller__user = request.user)
    sp = SubProduct.objects.get(pk = int(subp), seller_s = seller_s)
    prod = Products.objects.create(seller = seller_s.seller, min_p = int(min), max_p = int(max), subs = sp.subs, name = name)
    files = [
        MyFiles.objects.get(pk = int(f), name = f"seller:{seller_s.pk}") for f in files
    ]
    for f in files :
        prod.files.add(f)
    if details : prod.details = details
    prod.save()
    sp.products.add(prod)
    def find_dis() :
        find_good_dis(sp)
    send_by_thread(find_dis)
    return Response({
        'done' : True,
        'result' : prod.pk
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def add_sub(request) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    subp = request.data.get('subp')
    livraison = request.data.get('livraison')
    sp = SubProduct.objects.create(seller_s = seller_s, subs = SubCategory.objects.get(pk = int(subp)), livraison = livraison)
    return Response({
        'done' : True, 
        'result' : sp.pk
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def sold_prods(request) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    sprods = Products.objects.filter(seller = seller_s.seller, is_sold = True).order_by('-sold_date')
    return Response({
        'done' : True,
        'result' : ProductSerializer(sprods, many = True).data,
        'name' : seller_s.seller.name,
        'picture' : seller_s.seller.get_picture()
    })

@api_view(["POST"])
def has_paccount(request) :
    email = request.POST.get('email')
    patner = Patner.objects.filter(user__email = f"patner{email}")
    
    return Response({
        'done' : patner.exists(),
        'result' : 0
    })

@api_view(["POST"])
def register_patner(request) :
    email = request.POST.get('email')
    first_name = request.POST.get('first_name')
    last_name = request.POST.get('last_name')
    whatsapp = request.POST.get('whtasapp')
    quart = request.POST.get('quart')
    password = request.POST.get('password')
    patner = Patner.objects.filter(user__email = f"patner{email}")
    if patner.exists() :
        return Response({
            'done' :False,
            'result' : 1
        })
    user = User.objects.create(email = f"patner{email}", first_name = first_name, last_name = last_name, quart = quart)
    user.set_password(password)
    user.save()
    patner = Patner.objects.create(user = user, whatsapp = whatsapp)
    return Response({
        'done' : True, 
        'result' : patner.pk
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_patner(request) :
    patner = Patner.objects.get(user = request.user)
    return Response({
        'done' : True, 
        'result' : PatnerSerializer(patner).data
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_pparams(request) :
    patner = Patner.objects.get(user = request.user)
    return Response({
        'done' : True,
        'result' : {
            'name' : patner.get_user(),
            'p_count' : patner.p_count(),
            'picture' : patner.get_picture(),
            'momos' : MoMOSerializer(patner.momos.all(), many = True).data,
            'cur_momo' : patner.current_momo,
            'info' : {
                'first_name' : patner.user.first_name,
                'last_name' : patner.user.last_name,
                'email' : patner.user.email,
                'quart' : patner.user.quart,
                'whatsapp' : patner.whatsapp
            }
        }
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def set_ppicture(request) : 
    patner = Patner.objects.get(user = request.user)
    patner.picture = request.FILES.get('picture')
    patner.save()
    return Response({
        'done' : True,
        'result' : patner.get_picture()
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def pupdate_info(request) :
    token = request.POST.get('token')
    first_name = request.POST.get('first_name')
    last_name = request.POST.get('last_name')
    email = request.POST.get('email')
    whatsapp = request.POST.get('whatsapp')
    quart = request.POST.get('quart')
    adtok = AdminToken.objects.get(token = token)
    if int(adtok.name.split(':')[1]) == request.user.pk :
        us = request.user
        us.first_name = first_name
        us.last_name = last_name
        us.email = email
        us.quart = quart
        us.save()
        patner = Patner.objects.get(user = request.user)
        patner.whatsapp = whatsapp
        patner.save()
        return Response({
            'done' : True,
            'result' : 0
        })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def pupdate_password(request) :
    token = request.POST.get('token')
    ww_w = request.POST.get('ww_w')
    adtok = AdminToken.objects.get(token = token)
    if int(adtok.name.split(':')[1]) == request.user.pk :
        us = request.user
        us.set_password(ww_w)
        us.save()
        return Response({
            'done' : True,
            'result' : 0
        })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_ppays(request) :
    patner = Patner.objects.get(user = request.user)
    ppays = PatnerPay.objects.filter(patner = patner).order_by('-created_at')
    return Response({
        'done' : True,
        'result' : {
            'total_solde' : patner.total_solde,
            'solde' : patner.solde,
            'p_count' : patner.p_count(),
            'pays' : PatnerPaySerializer(ppays, many = True).data,
            'call_num' : get_value('service:payement'),
            'has_retr' : patner.has_retr()
        }
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_subpatner(request, id) :
    patner = Patner.objects.get(user = request.user)
    psub = PatnerSub.objects.get(pk = id, patner = patner)
    sps = get_ordered_subs(psub=psub.subs.pk, quart=patner.user.get_quart())
    print(sps)
    return Response({
        'done' : True,
        'result' : {
            'name' : psub.get_subs(),
            'sps' : SubProductDetailSerializer(sps, many = True).data
        }
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def padd_sub(request) :
    patner = Patner.objects.get(user = request.user)
    subp = request.data.get('subp')
    sp = PatnerSub.objects.create(patner = patner, subs = SubCategory.objects.get(pk = int(subp)))
    return Response({
        'done' : True, 
        'result' : sp.pk
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_dis(request) :
    patner = Patner.objects.get(user = request.user)
    root = request.GET.get('root')
    dis = patner.discussions.filter(statut = root, is_deleted = False).order_by('-created_at')
    if root != "En attente" :
        dis = dis.filter(rpatner = patner.pk)
    return Response({
        'done' :True,
        'result' : DiscussionSerializer(dis, many = True).data
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_mydis(request, id) :
    dis = Discussion.objects.get(pk = id)
    templates = dis.templates.all().order_by('price')
    patner = Patner.objects.get(user = request.user)
    if patner in dis.patner.all() :
        return Response({
            'done' : True,
            'result' : {
                'mydis' : DiscussionSerializer(dis).data,
                'templates' : PatnerTemplateSerializer(templates, many  =True).data
            }
        })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_recoms(request, id) :
    dis = Discussion.objects.get(pk = id)
    patner = Patner.objects.get(user = request.user)
    if patner in dis.patner.all() :
        subs = dis.demand.subs
        if not subs.sub_box :
            return Response({
                'done' : True,
                'result' : []
            })
        else :
            subs_pk = [
                s.pk for s in subs.sub_box.subs.all() if s != subs
            ]
            sps = SubProduct.objects.filter(subs__pk__in  = subs_pk)
            ordereds = order_subs(sps, patner.user.get_quart())
            return Response({
                'done' : True,
                'result' : SubProductDetailSerializer(ordereds, many = True).data
            })


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def delete_me(request, id) :
    patner = Patner.objects.get(user = request.user)
    dis = Discussion.objects.get(pk = id)
    if patner.pk == dis.rpatner and dis.statut == "Finalisé" :
        dis.is_deleted = True
        dis.save()
        return Response({
            'done' : True,
            'result' : 0
        })
    else :
        return Response({
            'done' : False,
            'result' : 1
        })

@transaction.atomic
@api_view(["POST"])
@permission_classes([IsAuthenticated])
def enable_payment(request, id) :
    patner = Patner.objects.get(user = request.user)
    dis = Discussion.objects.get(pk = id, rpatner = patner.pk)
    plan = request.data.get('plans')
    tot = int(request.data.get('tot'))
    pks = json.loads(request.data.get('pks'))
    try :
        patner_per = float(get_value(f'patner_percentage:{dis.get_label()}'))
        zwd_per = float(get_value(f'zwd_percentage:{dis.get_label()}'))
    except :
        patner_per = float(get_value('patner_percentage'))
        zwd_per = float(get_value('zwd_percentage'))
    patner_earn = float(patner_per * tot)
    zwd_earn = float(zwd_per * tot)
    plan += f"zwd:{zwd_earn}-patner:{patner_earn}"
    dis.amount = tot
    dis.payment_plan = plan
    dis.save()
    for p in pks :
        dis.sold.add(Products.objects.get(pk = p))
    adtok = AdminToken.objects.get_or_create(name = f'dem:{dis.demand.pk}-dis:{dis.pk}', token = f"dem:{dis.demand.pk}")
    return Response({
        'done' : True,
        'result' : 0
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def set_discuss(request, id) :
    patner = Patner.objects.get(user = request.user)
    dis = Discussion.objects.get(pk = id)
    if patner in dis.patner.all() and dis.demand.state == "En attente" :
        dis.rpatner = patner.pk
        dis.statut = "En cours"
        dis.demand.state = "En discussion"
        dis.demand.save()
        dis.save()
        return Response({
            'done': True,
            'result' : 0
        })
    else  :
        return Response({
            'done' : True   
        })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def disable_payment(request, id) :
    patner = Patner.objects.get(user = request.user)
    dis = Discussion.objects.get(pk = id, rpatner = patner.pk)
    dis.amount = 0
    dis.payment_plan = None
    dis.save()
    for p in dis.sold.all() : dis.sold.remove(p)
    adtok = AdminToken.objects.filter(name = f'dem:{dis.demand.pk}-dis:{dis.pk}', token = f"dem:{dis.demand.pk}").delete()
    return Response({
        'done' : True,
        'result' : 0
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_state(request, id) :
    patner = Patner.objects.get(user = request.user)
    dis = Discussion.objects.get(pk = id, rpatner = patner.pk)
    return Response({
        'done': True,
        'result' : dis.not_yet()
    })

@api_view(["POST"])
@permission_classes([IsAuthenticated])
def pprods_mm(request, id) :
    sp = SubProduct.objects.get(pk = id )
    min = request.data.get('min')
    max = request.data.get('max')
    prods = sp.products.filter(is_sold = False, min_p = int(min), max_p = int(max))
    return Response({
        'done' : True,
        'result' : ProductSerializer(prods, many = True).data
    })

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def delete_sp(request, id) :
    seller_s = SellerState.objects.get(seller__user = request.user)
    sp = SubProduct.objects.get(pk = id, seller_s = seller_s)
    sp.delete()
    return Response({
        'done' : True,
        'result' : 0
    })

@api_view(["GET"])
def get_version(request) :
    try :
        return Response({
            'done' : True,
            'result' : json.loads(get_value('cur_version'))
        })
    except Exception as e :
        print(e)
        return Response({
            'done' : False
        })