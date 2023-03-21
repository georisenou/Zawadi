import json
from time import sleep
from django.db.models import Q
from app.models import SellerAccount, get_patner_data, send_messages
from django.db.models import Count, Max, Min
from .models import Demand, Discussion, Patner, PatnerSub, PatnerTemplate, Products, PRICE_PER, SubProduct

#sp refer to SubProduct Table

def get_templates(dem) :
    sps = SubProduct.objects.filter(subs = dem.subs).annotate(p_count = Count('products')).filter(p_count__gt=0) if dem.subs.sub_box else SubProduct.objects.filter(Q(subs__sub_box = dem.subs) | Q(subs = dem.subs)).annotate(p_count = Count('products')).filter(p_count__gt=0)
    sps_lis = [
        {'sp' : sp, 'dis' : sp.seller_s.seller.get_distance(dem.get_quart())} for sp in sps
    ]
    sps_lis.sort(key = lambda e : e['dis'])
    print(sps_lis)
    return sps_lis

def get_right_patner(dem, sauf = []) :
    patners = []
    all_p = Patner.objects.filter(is_on = True).exclude(pk__in = sauf)
    for p in all_p :
        patners.append({
            'patner' : p,
            'distance' : p.get_distance(json.loads(dem.client.user.quart))
        })
    return sorted(patners, key=lambda e: e['distance'])


def send_notif_to_patner(patner, dem) :
    send_messages(get_patner_data(patner), f'dem+{dem.pk}:patner{patner.pk}')

def build_discussions(dem, sauf = []) :
    sps = get_templates(dem)
    patners  =get_right_patner(dem, sauf)
    discussion = Discussion.objects.create(demand = dem, statut = "En attente")
    for sp in sps :
        template = PatnerTemplate.objects.create(sub_p = sp['sp'], price = sp['dis'], typ = 'for_dem:in')
        discussion.templates.add(template)
    for patner in patners[:5] :
        discussion = Discussion.objects.get(demand = dem)
        if discussion.statut == "En attente" :
            discussion.patner.add(patner['patner'])
            discussion.rpatner = patner['patner'].pk
            discussion.save()
            send_notif_to_patner(patner, dem)
        else :
            break
        sleep(3600)

def find_good_dis(sp) :
    if sp.products.count() :
        dis = Discussion.objects.filter(Q(statut = "En cours") | Q(statut = "En attente")).filter(is_deleted = False).filter(Q(demand__subs = sp.subs) | Q(demand__subs__sub_box = sp.subs))
        for d in dis :
            price = sp.seller_s.seller.get_distance(d.demand.get_quart())
            template = PatnerTemplate.objects.get_or_create(sub_p = sp, price = price, typ = 'for_dem:out')[0]
            if not template in d.templates.all() : d.templates.add(template)
    

