
import datetime
import json
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from app.models import AbnFeature, AdminToken, Category, ClientDemand, Feedback, Label, MyFiles, SellerAccount, SubCategory, User, UserGame, WeekCustom, ZawadiDetail, Client, checking_token, get_welcome_message, ident_generator, send_messages, send_whatsapp_notif
from django.contrib.auth import login, authenticate, logout
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django.db import transaction
from rest_framework.permissions import IsAuthenticated
from .core import Kkiapay
from django.db.models import Count, Max, Min
import threading
from rest_framework import serializers
from firebase_admin.messaging import Message as Mss, Notification, AndroidNotification, WebpushConfig, WebpushFCMOptions, AndroidConfig, APNSConfig, APNSPayload, Aps
from fcm_django.models import FCMDevice
from django.core.paginator import Paginator
from .algorithm import *
import subprocess
from django.http import HttpResponse
import os
from django.views.decorators.csrf import csrf_exempt
# Create your views here.

def register_logs(slug, resp) :
    logs = ZawadiDetail.objects.get('whatsapp_logs')
    logs.value += f"$${slug}:<!0{json.dumps(resp)}0!>"
    logs.save()

def get_obj_from_paginator(arts, number, p, serializer):
    paginator = Paginator(arts, number)
    total = paginator.num_pages
    if total < int(p):
        return {
            "done": False,
            "result": []
        }
    else:
        page = paginator.page(p)
        return {
            "done": True,
            "result": serializer(page.object_list, many=True).data,
        }

def increment_value(key) :
    det = ZawadiDetail.objects.get_or_create(key = key)[0]
    try :
        det.value = str(int(det.value) + 1)
    except Exception as e :
        print(e)
        det.value = "0"
    det.save()
    return det

def send_by_thread(func):
    proc = threading.Thread(target=func)
    proc.start()


def check_is_out(client):
    if client.weeks_in.all().count() > 7:
        client.is_out = True
        client.save()
    return client


def send_notif(seller):
    try:
        device = FCMDevice.objects.get(user=seller.user)
        options = WebpushFCMOptions(
            link=f"{get_value('site:link')}/clients/0/")
        webpush = WebpushConfig(fcm_options=options)
        device.send_message(
            Mss(notification=Notification(title="Zawadi - Nouveau client !",
                body="Un nouveau client vient d'être ajouté à votre liste de la semaine."), webpush=webpush)
        )
    except Exception as e:
        print('FCM Error ===> ', e)


def merge_list(l1, l2):
    return [
        e for e in l1 if e in l2
    ]

def check_token(tok, slug = 'trial') :
    admin = AdminToken.objects.filter(token = tok, name__icontains = slug, is_checked = False )
    if admin.exists() :
        return admin.name.split(':')[0]
    return 0

def get_on_week(seller):
    weeks = seller.weeks.filter(is_on=True)
    if weeks.exists():
        return weeks.first()
    else:
        if seller.rest:
            return create_week(seller)


def add_client_to_week(client, week):
    week.demandes.add(client)
    check_week(week)
    week.seller.count += 1
    week.seller.save()
    send_notif(week.seller)


def check_week(week):
    if week.demandes.all().count() >= week.max or week.seller.rest == 0:
        week.is_on = False
        week.save()
    return week

def range_to_favor(lis) -> list :
    sellers = SellerAccount.objects.filter(pk__in = lis)
    d = []
    for seller in sellers :
        d.append({
            'pk' : seller.pk,
            'cur' : get_on_week(seller).demandes.count()
        })
    return range7(d)

def range7(d) -> list :
    k = sorted(d, key=lambda e : e['cur'] )
    return [
        e['pk'] for e in k
    ]


def send_client_to_seller(client):
    sellers = SellerAccount.objects.filter(
        rest__gt=0)
    sellers = [
        s for s in sellers if client.category in s.category.all()
    ]
    seller_pks = [
        seller.pk for seller in sellers if (client.subs in seller.subs.all() and (len(merge_list(seller.user.towns.split(':'), client.client.user.towns.split(':')))))
    ]
    fsellers = SellerAccount.objects.filter(pk__in=seller_pks)
    zero_pk = [
        s.pk for s in fsellers if get_on_week(s).get_level() == 'free'
    ]
    first_pk = [
        s.pk for s in fsellers if get_on_week(s).get_level() == 'first'
    ]
    second_pk = [
        s.pk for s in fsellers if get_on_week(s).get_level() == 'second'
    ]
    third_pk = [
        s.pk for s in fsellers if get_on_week(s).get_level() == 'third'
    ]
    first_pk = range_to_favor(zero_pk) + range_to_favor(first_pk) + range_to_favor(second_pk) + range_to_favor(third_pk)
    i = 0
    for pk in first_pk:
        if i < client.num_vend :
            add_client_to_week(client, get_on_week(
                SellerAccount.objects.get(pk=pk)))
            i += 1
        else :
            client.is_out = True
    client.save()


def get_value(key):
    return ZawadiDetail.objects.get(key=key).value


def create_week(seller):
    for week in seller.weeks.all():
        if week.end < datetime.date.today():
            week.is_on = False
            week.save()
    wks = seller.weeks.all().filter(is_on = True)
    if not wks.exists():
        week = WeekCustom.objects.create(seller=seller)
        week.begun = datetime.date.today()
        week.end = datetime.date.today() + datetime.timedelta(days=7)
        week.save()
        last_week = seller.weeks.exclude(pk=week.pk).order_by('-end').first()
        if last_week:
            last_week.next = week.pk
            last_week.save()
            week.prev = last_week.pk
            week.save()
        week.max = int(get_value(seller.type_of + ':max'))
        week.max_urg = int(get_value(seller.type_of + ':max_urg'))
        week.save()
    else :
        week = seller.get_week()
    return week


def check_seller(seller):
    if seller.damount < seller.dprice:
        seller.rest = 0
        if seller.get_week() :
            seller.get_week().is_on = False
            seller.get_week().save()
        seller.status = False
        seller.save()
    return seller


def check_week_(week):
    if week.end < datetime.date.today():
        week.is_on = False
        week.save()
        if week.seller.rest:
            week = create_week(week.seller)
    return week


def index(request):
    source = request.GET.get('source')
    from_ = request.GET.get('from')
    essai = request.GET.get('essai', '')
    if from_ : increment_value(from_)
    direct_regist = False
    if not source :
        source = 'website'
    increment_value(source)
    feeds = Feedback.objects.all().order_by('-rank')
    contact = ZawadiDetail.objects.get(key='contact:home')
    has_submit = False
    if request.method == "POST":
        text = request.POST.get('text')
        try:
            Feedback.objects.create(user=f"{request.user.first_name} {request.user.last_name}",
                                    seller=request.user.accounts.first().name, text=text)
            has_submit = True
        except Exception as e:
            print(e)
    if from_ and (not request.user.is_authenticated) :
        direct_regist = True
    return render(request, 'index.html', {
        'root': 'home',
        'feeds': feeds[:4],
        'contact': contact,
        'has_submit': has_submit,
        'from_' : from_ ,
        "direct" : direct_regist,
        "trial" : check_token(essai) if check_token(essai) else 0
    })


@login_required(login_url='/login')
def clients(request, pk):
    has_abn = False
    seller = request.user.accounts.all().first()
    if seller :
        has_abn = True and seller.rest > 0
    cur_week = 0
    if seller :
        cur_week = seller.get_week()
    contact = ZawadiDetail.objects.get(key='contact:home')
    can_notif = FCMDevice.objects.filter(user=request.user).exists()
    if not pk:
        myweek = cur_week
    else:
        myweek = WeekCustom.objects.get(pk=pk)
    has_rank = False
    if request.method == 'POST':
        point = request.POST.get('point')
        dem = request.POST.get('dem')
        if dem:
            dem = ClientDemand.objects.get(pk=int(dem))
            point = int(point)
            dem.point = point
            dem.save()
            has_rank = True
    return render(request, 'clients.html', {
        'root': 'client',
        'seller': seller,
        'week': myweek,
        'has_rank': has_rank,
        'contact': contact,
        'can_notif': can_notif,
        'has_abn' : has_abn
    })


def login_view(request):
    err = []
    contact = ZawadiDetail.objects.get(key='contact:home')
    next = request.GET.get('next')
    print(next)
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            user = authenticate(email=email, password=password)
            if user:
                login(request, user)
                if next:
                    return redirect(next)
                return redirect('index')
            else:
                err.append(
                    'La connexion a échoué! Veuillez vérifier vos identiiants.')
        except Exception as e:
            print(e)
            err.append(
                'La connexion a échoué! Veuillez vérifier vos identiiants.')
    return render(request, 'login.html', {
        'err': err,
        'contact': contact
    })


def register_view(request):
    err = []
    if request.method == 'POST':
        post = dict(request.POST)
        first_name = post['first_name'][0]
        last_name = post['last_name'][0]
        email = post['email'][0]
        password = post['password'][0]
        country = post['country'][0]
        users = User.objects.filter(email=email)
        quart = post['quart'][0]
        if users.exists():
            err.append('Cet email a déjà été utilisé.')
            return render(request, 'register.html', {
                'err': err
            })
        try:
            user = User.objects.create_user(email=email, password=password, first_name=first_name,
                                            last_name=last_name, country=country,  quart = quart)
        except:
            err.append(
                'Une erreur est survenue. Veuillez vérifier vos identifiants.')
            return render(request, 'register.html', {
                'err': err
            })
        login(request, user)
        from_ = request.GET.get('from')
        next = request.GET.get('next')
        if next :
            return redirect(next)
        if not from_ : return redirect('index')
        return redirect('activate2')
    return render(request, 'register.html', {
        'err': err
    })


@login_required(login_url='/login')
def activate(request):
    seller = request.user.accounts.all().first()
    categories = Category.objects.all()
    labels = Label.objects.all()
    return render(request, 'activate.html', {
        'seller': seller,
        'categories': categories,
        'token': ZawadiDetail.objects.get(key='kkiapay_public').value
    })


@login_required(login_url='/login')
def new_activate(request):
    seller = request.user.accounts.all().first()
    categories = Category.objects.all()
    return render(request, 'activate1.html', {
        'seller': seller,
        'user' : request.user,
        'categories': categories,
        'token': ZawadiDetail.objects.get(key='kkiapay_public').value
    })

@login_required(login_url='/register')
def very_new_activate(request):
    seller = request.user.accounts.all().first()
    categories = Category.objects.all()
    labels = Label.objects.all()
    return render(request, 'activate2.html', {
        'seller': seller,
        'categories': categories,
        'token': ZawadiDetail.objects.get(key='kkiapay_public').value,
        'labels' : labels,
        "can_freed" : request.user.can_freed()
    })


@login_required(login_url='/login')
def compte(request):
    seller = request.user.accounts.all().first()
    categories = Category.objects.all()
    has_modif = False
    err = []
    labels = Label.objects.all()
    if request.method == 'POST':
        image = request.FILES.get('image')
        if image:
            seller.picture = image
            seller.save()
        else:
            try:
                name = request.POST.get('name')
                #category = request.POST.get('category')
                #subs = dict(request.POST)['r_subs[]']
                #subs = SubCategory.objects.filter(name__in=subs)
                #print(subs)
                r_subs = json.loads(request.POST.get('r_subs'))
                cats = [
                    Category.objects.get(pk = int(s['cat'])) for s in r_subs
                ]
                subs = [
                    SubCategory.objects.get(pk = int(s['id'])) for s in r_subs
                ]
                first_name = request.POST.get('first_name')
                last_name = request.POST.get('last_name')
                email = request.POST.get('email')
                password = request.POST.get('password')
                if request.user.check_password(password):
                    request.user.first_name = first_name
                    request.user.last_name = last_name
                    request.user.email = email
                    request.user.save()
                    seller.name = name
                    for c in seller.category.all() :
                        seller.category.remove(c)
                    for c in cats :
                        seller.category.add(c)
                    seller.save()
                    for sub in seller.subs.all():
                        seller.subs.remove(sub)
                    for sub in subs:
                        seller.subs.add(sub)
                    has_modif = True
                else:
                    err.append('Le mots de passe entré est incorrect.')
            except Exception as e:
                print(e)
                err.append(
                    'Une erreur est survenue lors de la modification. Réessayez plus tard')
    return render(request, 'compte.html', {
        'root': 'profil',
        'seller': seller,
        'categories': categories,
        'err': err,
        'has_modif': has_modif,
        'labels' : labels
    })


def customers(request):
    increment_value('zawadi_visits')
    from_ = request.GET.get('from')
    if from_ : increment_value(from_)
    print(request.user)
    try :
        ready = get_value('blog_ready') == 'yes'
    except :
        ready = False
    zawadi = get_value('zawadi')
    categories = Category.objects.all()
    has_user = request.user.is_authenticated
    cat_first = categories.first().pk
    feeds = Feedback.objects.all().filter(rank__lt = 0).order_by('rank')[:3]
    labels = Label.objects.all()
    print(ready, "ready")
    demandes = []
    if has_user:
        demandes = ClientDemand.objects.filter(
            client__user=request.user).order_by('-created_at')[:25]
    return render(request, 'client_app/index.html', {
        'zawadi': zawadi,
        'categories': categories,
        'f': cat_first,
        'dems': demandes,
        'count': len(demandes),
        'feeds': feeds,
        "labels" : labels,
        'ready' : ready,
        'has_user': has_user and Client.objects.filter(user=request.user).exists()
    })

@api_view(["GET", "POST"])
@permission_classes([IsAuthenticated])
def charg_account(request) :
    seller = SellerAccount.objects.get_or_create(user=request.user)[0]
    if request.method == 'POST':
        name = request.POST.get('name')
        r_subs = json.loads(request.POST.get('subs'))
        cats = [
            Category.objects.get(pk = int(s['cat'])) for s in r_subs
        ]
        subs = [
            SubCategory.objects.get(pk = int(s['id'])) for s in r_subs
        ]
        dspeed = request.POST.get('dspeed')
        dprice = request.POST.get('dprice')
        amount = request.POST.get('amount')
        transaction = request.POST.get('transaction')
        status = False
        if not dspeed == 'free' :
            k = Kkiapay(get_value('kkiapay_public'), get_value(
                'kkiapay_private'), get_value('kkiapay_secret'))
            trans = k.verify_transaction(transaction_id=transaction)
            status = trans.status == "SUCCESS"
        if status or dspeed == 'free':
            seller.name = name
            for c in seller.category.all() :
                seller.category.remove(c)
            for c in cats :
                seller.category.add(c)
            for s in seller.subs.all():
                seller.subs.remove(s)
            for s in subs:
                seller.subs.add(s)
                seller.status = True
                seller.last_abn = datetime.date.today()
                seller.type_of = dspeed
                seller.speed = int(get_value(dspeed + ':speed'))
                seller.rest = 1
                seller.dprice = int(dprice)
                seller.damount = int(amount)
                seller.damount_init = int(amount)
                seller.save()
            if not seller.weeks.filter(is_on=True).exists():
                week = create_week(seller)
            abn = AbnFeature.objects.create(
                seller=seller, type_of=dspeed, transaction_id=transaction, expired_date=datetime.date.today() + datetime.timedelta(days=30))
            if dspeed == 'free' :
                seller.has_freed = True
                abn.is_freed = True
                abn.save()
                seller.save()
            return Response({
                'done': True,
                'result': abn.pk
            })

@api_view(["GET", "POST"])
@permission_classes([IsAuthenticated])
def activ_abn(request):
    seller = SellerAccount.objects.get_or_create(user=request.user)[0]
    if request.method == 'POST':
        name = request.POST.get('name')
        cat = request.POST.get('cat')
        r_subs = json.loads(request.POST.get('subs'))
        subs = [
            SubCategory.objects.get(pk = int(s['id'])) for s in r_subs
        ]
        cats = [
            Category.objects.get(pk = int(s['cat'])) for s in r_subs
        ]
        choice = request.POST.get('choice')
        total = request.POST.get('total')
        transaction = request.POST.get('transaction')
        status = False
        if not choice == 'free' :
            k = Kkiapay(get_value('kkiapay_public'), get_value(
                'kkiapay_private'), get_value('kkiapay_secret'))
            trans = k.verify_transaction(transaction_id=transaction)
            status = trans.status == "SUCCESS"
        if status or choice == 'free':
            seller.name = name
            for c in seller.category.all() :
                seller.category.remove(c)
            for c in cats :
                seller.category.add(c)
            for s in seller.subs.all():
                seller.subs.remove(s)
            for s in subs:
                seller.subs.add(s)
            seller.status = True
            seller.last_abn = datetime.date.today()
            seller.expired_date = datetime.date.today() + datetime.timedelta(days=30)
            seller.type_of = choice
            seller.speed = int(get_value(choice + ':speed'))
            seller.rest = 1
            seller.save()
            if not seller.weeks.filter(is_on=True).exists():
                week = create_week(seller)
            abn = AbnFeature.objects.create(
                seller=seller, type_of=choice, transaction_id=transaction, expired_date=datetime.date.today() + datetime.timedelta(days=30))
            if choice == 'free' :
                seller.has_freed = True
                abn.is_freed = True
                abn.save()
                seller.save()
            return Response({
                'done': True,
                'result': abn.pk
            })


@api_view(["GET", "POST"])
@permission_classes([IsAuthenticated])
def create_devices(request):
    fcm = FCMDevice.objects.get_or_create(
        registration_id=request.data['registration_id'], name=request.user.username, type=request.data['type'], user=request.user)
    if fcm[1]:
        fcm = FCMDevice.objects.filter(
            user=request.user).exclude(pk=fcm[0].pk).delete()
    return Response({
        'done': True,
    })


def logout_view(request):
    logout(request)
    return redirect('/')



@api_view(["POST"])
def register_demand(request):
    if not request.user.is_authenticated:
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        country = request.POST.get('country')
        number = request.POST.get('number')
        whatsapp = request.POST.get('whatsapp')
        quart = request.POST.get('quart')
        if  User.objects.filter(email = email).exists():
            user = User.objects.get(email = email)
            user.quart = quart
            user.save()
        else:
            if  User.objects.filter(email = first_name + email).exists():
                user = User.objects.get(email = first_name + email)
            elif User.objects.filter(email = last_name + first_name + email).exists() :
                user = User.objects.get(email = last_name + first_name + email)
            else :
                user = User.objects.create_user(email=email, password=first_name + last_name + number, first_name=first_name,
                                            last_name=last_name, country=country, quart = quart)
        login(request, user = user)
        client = Client.objects.get_or_create(
            user=user, phone=number, whatsapp=whatsapp)[0]
    else:
        clients = Client.objects.get_or_create(user=request.user)
        client = clients[0]
        if clients[1]:
            number = request.POST.get('number')
            whatsapp = request.POST.get('whatsapp')
            client.phone = number
            client.whatsapp = whatsapp
            client.save()
    cat = request.POST.get('cat')
    subs = json.loads(request.POST.get('subs'))
    emer = request.POST.get('emer')
    state = request.POST.get('state')
    keys = list(request.FILES.keys())
    sub_det = json.loads(request.POST.get('sub_det'))
    pks = []
    unique_slug = f"client:{client.pk}__{ident_generator(100, 250)}"
    for sub in subs:
        mysub = SubCategory.objects.get(pk = int(sub['id']))
        demand = ClientDemand.objects.create(
            client=client, subs= mysub , category = Category.objects.get(pk = int(cat)), emergency=emer, quart = request.user.quart, slug = unique_slug, state = state)
        for det in sub_det :
            if det['id'] == mysub.pk :
                if det.get('bdg') :
                    demand.budget = det.get('bdg')
                if det.get('detail') :
                    demand.detail = det.get('detail')
                if det.get('num_prod') :
                    demand.num = det.get('num_prod')
                for key in keys :
                    if f"file:{det['id']}:" in key :
                        myfile = MyFiles.objects.create(name = "demand_"+ key, file = request.FILES.get(key) )
                        demand.files.add(myfile)
        demand.save()
        pks.append(demand.pk)
    def send_dem():
        main(unique_slug)
    send_by_thread(send_dem)
    return Response({
        'done': True,
        'result': pks
    })



def daily_task(request):
    mess = "Reussite !! "
    mess2 = " - Reusite"
    user = request.GET.get('trial')
    adm_tok = 0
    if user :
        token = ident_generator(5, 8)
        adm_tok = AdminToken.objects.create(name = user + ':trial', token = token)
    try:
        sellers = SellerAccount.objects.all()
        for seller in sellers:
            seller = check_seller(seller)
            week = create_week(seller)
    except Exception as e:
        mess = str(e)
    try :
        dems = ClientDemand.objects.filter(is_out = False)
        slugs = []
        for dem in dems : 
            if not dem.slug in slugs : slugs.append(dem.slug)
        for slug in slugs :
            main(slug)
    except Exception as e :
        mess2 = f" - {e}"
    num_ = get_value('testors')
    num = len(json.loads(num_))
    return render(request, 'daily_task.html', {
        "mess": mess + mess2,
        "tok" : adm_tok,
        'num' : num
    })



def achat_manifest( request) :
    data = {
  "name": "Zawadi",
  "short_name": "Zawadi",
  "theme_color": "#cb0e40",
  "background_color": "#cb0e40",
  "display": "standalone",
  "scope": "/",
  "start_url": "/",
  "icons": [
    {
      "src": "/static/achat/icons/icon-72x72.png",
      "sizes": "72x72",
      "type": "image/png",
    },
    {
      "src": "/static/achat/icons/icon-96x96.png",
      "sizes": "96x96",
      "type": "image/png",
    },
    {
      "src": "/static/achat/icons/icon-128x128.png",
      "sizes": "128x128",
      "type": "image/png",
    },
    {
      "src": "/static/achat/icons/icon-144x144.png",
      "sizes": "144x144",
      "type": "image/png",
    },
    {
      "src": "/static/achat/icons/icon-152x152.png",
      "sizes": "152x152",
      "type": "image/png",
    },
    {
      "src": "/static/achat/icons/icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png",
    },
    {
      "src": "/static/achat/icons/icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png",
    }
  ]
}
    return JsonResponse(data, safe=False)

def vendeur_manifest( request) :
    data = {
  "name": "Zawadi Vendeur",
  "short_name": "Zawadi",
  "theme_color": "#16a34a",
  "background_color": "#16a34a",
  "display": "standalone",
  "scope": "/",
  "start_url": "/",
  "icons": [
    {
      "src": "/static/vendeur/icons/icon-72x72.png",
      "sizes": "72x72",
      "type": "image/png",
    },
    {
      "src": "/static/vendeur/icons/icon-96x96.png",
      "sizes": "96x96",
      "type": "image/png",
    },
    {
      "src": "/static/vendeur/icons/icon-128x128.png",
      "sizes": "128x128",
      "type": "image/png",
    },
    {
      "src": "/static/vendeur/icons/icon-144x144.png",
      "sizes": "144x144",
      "type": "image/png",
    },
    {
      "src": "/static/vendeur/icons/icon-152x152.png",
      "sizes": "152x152",
      "type": "image/png",
    },
    {
      "src": "/static/vendeur/icons/icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png",
    },
    {
      "src": "/static/vendeur/icons/icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png",
    }
  ]
}
    return JsonResponse(data, safe=False)

def achat_serviceworker(request) :
    return render(request, 'a_serviceworker.js',content_type="text/javascript")

def vendeur_serviceworker(request) :
    return render(request, 'v_serviceworker.js',content_type="text/javascript")

def achat_offline(request) :
    return render(request, 'client_app/offline.html', {})

def offline( request) :
    return render(request, 'offline.html', {})

class DemandSerializer(serializers.ModelSerializer) :
    subs = serializers.CharField(source="subs.name")
    class Meta :
        model = ClientDemand
        fields = ('id', 'subs', 'get_duration', 'sends_num', 'detail', 'budget', 'num', 'get_files', 'num_vend')

def valid_p(p) :
    try : 
        p = int(p)
        return p
    except : 
        return 1

class SubSubCategorySerializer( serializers.ModelSerializer) :
    class Meta :
        model = SubCategory
        fields = ('id', 'name', 'is_subs' )

class SubCategorySerializer( serializers.ModelSerializer) :
    get_subs = SubSubCategorySerializer(many = True)
    class Meta :
        model = SubCategory
        fields = ('id', 'name', 'get_subs','is_subs')

class CategorySerializer(serializers.ModelSerializer) :
    subs = SubCategorySerializer(many = True)
    class Meta :
        model = Category
        fields = ('id', 'name', 'subs')

class LabelSerializer(serializers.ModelSerializer) :
    cats = CategorySerializer(many = True)
    class Meta :
        model = Label
        fields = ('id', 'name', 'cats')

@api_view(["GET", "POST"])
def get_all_cats( request) :
    labels = Label.objects.all()
    return Response({
        'done' : True,
        'result' : LabelSerializer(labels, many = True).data
    })

@api_view(["GET", "POST"])
def get_demands(request) :
    if request.user.is_authenticated :
        client = request.user.clients.first()
    else :
        email = request.POST.get('email')
        user = User.objects.filter(email__contains = email).first()
        client = user.clients.first()
    demandes = client.demandes.all().order_by('-created_at')
    obj = get_obj_from_paginator(demandes, 20, valid_p(request.GET.get('p')), DemandSerializer )
    return Response(obj)

@api_view(["GET", "POST"])
def delete_demand(request, pk) :
    action = request.GET.get('action')
    demand = ClientDemand.objects.get(pk = pk)
    if request.user == demand.client.user :
        if action  :
            user_sold = ZawadiDetail.objects.get_or_create(key = f"{request.user} - {action}")
            if user_sold[1] :
                user_sold[0].value = json.dumps([])
                user_sold[0].save()
            user_sold = ZawadiDetail.objects.get_or_create(key = f"{request.user} - {action}")
            user_sold = user_sold[0]
            v = json.loads(user_sold.value)
            v.append(demand.subs.name)
            user_sold.value = json.dumps(v)
            user_sold.save()
        demand.delete()
        return Response({
            'done' : True,
            'result' : pk
        })


def coming_soon(request) :
    has_regis = False
    if request.method == "POST" :
        number = request.POST.get("number")
        testors = ZawadiDetail.objects.get_or_create(key="testors")
        if testors[1] :
            testors[0].value = json.dumps([])
            testors[0].save()
        testors = ZawadiDetail.objects.get_or_create(key="testors")[0]
        v = json.loads(testors.value)
        if number :
            v.append(number)
            testors.value = json.dumps(v)
            testors.save()
            has_regis = True
    return render(request, 'soon.html', {
        'has_regis' : has_regis
    })

@api_view(["GET", "POST"])
def set_num_vend(request) :
    dem = ClientDemand.objects.get(pk = int(request.GET.get('dem')))
    num_vend = int(request.GET.get('num_vend'))
    if request.user == dem.client.user :
        dem.num_vend = num_vend
        dem.save()
    def resend_vend() :
        dem = ClientDemand.objects.get(pk = int(request.GET.get('dem')))
        weeks = dem.weeks_in.all()
        for week in weeks :
            week.demandes.remove(dem)
        dem.is_out = False
        dem.save()
        send_client_to_seller(dem)
    send_by_thread(resend_vend)
    return Response({
        'done' : True
    })

def backup( request) :
    do = request.GET.get('do')
    if not do :
        with open('mdumpy.sql', 'w') as f :
            process = subprocess.Popen(['pg_dump', '-d' ,'postgresql://db:AVNS_GZq0FVICvAz1Hezu5oD@app-93023c8c-80ae-40d0-9ad3-275b052b3ef2-do-user-12855964-0.b.db.ondigitalocean.com:25060/db?sslmode=require'], stdout=f, stderr=f, universal_newlines=True)
            process.wait()
        with open('mdumpy.sql', 'r') as w :
            return HttpResponse( w.read())
    else :
        db_uri = os.getenv('DATABASE_URL', '')
        return HttpResponse('update3_____' + db_uri )

def for_sellers(request) :
    pk = request.GET.get('seller')
    seller = SellerAccount.objects.get(pk = int(pk))
    if request.method == "POST" :
        whtasapp = request.POST.get('whatsapp')
        seller.whatsapp = whtasapp
        seller.save()
        return redirect('/clients/0/')
    return render(request, 'for_sellers.html', {
        'seller' : seller
    })

def unique_clients(request, token) :
    has_abn = False
    is_checked = checking_token(token) 
    if is_checked[0] :
        user = User.objects.get(pk = is_checked[1])
        seller = user.accounts.first()
        can_notif = FCMDevice.objects.filter(user=request.user).exists()
        if seller :
            has_abn = True and seller.rest > 0
        return render(request, 'clients.html', {
        'root': 'client',
        'seller': seller,
        'week': seller.get_week(),
        'has_rank': False,
        'contact' : ZawadiDetail.objects.get(key='contact:home'),
        'can_notif': can_notif,
        'has_abn' : has_abn
    })

@api_view(["GET", "POST"])
def register_demands_clicked(request, dem, seller) :
    cdem = ClientDemand.objects.get(pk = dem)
    rseller = SellerAccount.objects.get(pk = seller)
    cdem.clicked.add(rseller)
    return Response({
        'done' : True,
        'result' : []
    })

def change_pass(request, token) :
    token = AdminToken.objects.get(token = token, is_checked = False)
    seller = SellerAccount.objects.get(user__pk = int(token.name.split(':')[1]))
    if request.method == 'POST' :
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        if not password1 == password2 :
            return render( request, 'change_pass.html', {
                'seller' : seller,
                'err' : 'Les mots de passes entrés ne sont pas identiques'
            })
        else :
            seller.user.set_password(password1)
            seller.user.save()
            if seller.user.check_password(password2) :
                return redirect('/clients/0/')
    return render( request, 'change_pass.html', {
        'seller' : seller
    })

@api_view(["GET", "POST"])
def compute_dprice(request) :
    subs = json.loads(request.data.get('subs'))
    price = 0
    for s in subs :
        price += Category.objects.get(pk = int(s['cat'])).dprice
    return Response({
        "done" : True,
        "result" : price / len(subs)
    })

@api_view(["GET", "POST"])
def set_whatsapp(request, pk) :
    seller = SellerAccount.objects.get(pk = pk)
    if request.method == 'POST' :
        num = request.POST.get('num')
        seller.format_number = num
        seller.save()
        send_messages(get_welcome_message(seller), slug=f'welcome-{seller.pk}')
    return Response({
        'done' : True,
        'result' : pk
    })



def landing_page(request) :
    feeds = Feedback.objects.all().order_by('-rank')
    has_validate = False
    if request.method == 'POST' :
        whatsapp = request.POST.get('whatsapp')
        pot_sellers = ZawadiDetail.objects.get_or_create(key = 'pot_sellers')
        if pot_sellers[1] :
            lis = []
        else :
            try :
                lis = json.loads(pot_sellers[0].value)
            except :
                lis = []
        lis.append(whatsapp)
        pot_sellers[0].value = json.dumps(lis)
        pot_sellers[0].save()
        has_validate = True
    return render(request, 'landing.html', {
        'testimonies': feeds[:4],
        'has_validate' : has_validate
    })

def verify_fb_token(token_sent, request):
    #take token sent by facebook and verify it matches the verify token you sent
    #if they match, allow the request, else return an error 
    print(token_sent, " IS TOKEN")
    if token_sent == get_value('MESSENGER_VERIFY_TOKEN'):
        return HttpResponse(request.GET.get("hub.challenge"))

    return HttpResponse('Invalid verification token')

@csrf_exempt
def fq_webhook(request) :
    if request.method == 'GET':
        token_sent = request.GET.get("hub.verify_token")
        return verify_fb_token(token_sent, request)

