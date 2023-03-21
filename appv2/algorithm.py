import json
from time import sleep

from app.models import SellerAccount, get_patner_data, send_messages
from .models import Discussion, Patner, PatnerSub, PatnerTemplate, Products, PRICE_PER, SubProduct

def get_all_sellers(dem) :
    subs_pk = []
    for ss in dem.ssubs.all() :
        subs_pk.append(ss.pk)
    if not len(subs_pk) :
        subs_pk.append(dem.subs.pk)
    prods = Products.objects.filter(subs__in = subs_pk, is_sold = False)
    sellers = []
    for prod in prods :
        found = False
        for s in sellers :
            if s['seller'] == prod.seller :
                s['products'].append(prod)
                found = True
                break
        if not found :
            sellers.append({
                'seller' : prod.seller,
                'products' : [prod]
            })
    for s in sellers :
        s['price'] = get_price(s, dem)
    return sorted(sellers, key= lambda e : e['price'], reverse=True)

def get_price(seller, dem) -> int :
    p_price = 0
    for prod in seller['products'] :
        p_price += prod.max_p
    distance = seller['seller'].get_distance(json.loads(dem.client.user.quart)) * PRICE_PER
    print(f"Total for seller {seller['seller'].name} => {p_price + distance}")
    return distance + p_price

def send_notif_to_patner(patner, dem) :
    send_messages(get_patner_data(patner), f'dem+{dem.pk}:patner{patner.pk}')

def get_right_patner(dem) :
    patners = []
    all_p = Patner.objects.all()
    for p in all_p :
        patners.append({
            'patner' : p,
            'distance' : p.get_distance(json.loads(dem.client.user.quart))
        })
    return sorted(patners, key=lambda e: e['distance'])

def build_discussion(dem) :
    discussion = Discussion.objects.create(demand = dem, statut = "En attente")
    sellers = get_all_sellers(dem)
    for s in sellers :
        template = PatnerTemplate.objects.create(sub_p = s['seller'], price = s['price'])
        for p in s['products'] :
            template.products.add(p)
        discussion.templates.add(template)
    patners = get_right_patner(dem=dem)
    for patner in patners[:5] :
        discussion = Discussion.objects.get(demand = dem)
        if discussion.statut == "En attente" :
            discussion.patner.add(patner['patner'])
            discussion.rpatner = patner['patner'].pk
            discussion.save()
            send_notif_to_patner(patner['patner'], dem)
        else :
            break
        sleep(3600)

def get_ordered_subs(psub : int, quart)  :
    sps = SubProduct.objects.filter(subs__pk = psub)
    print('sps => ', sps)
    sellers_pk = [
        {'id' : sp.seller_s.seller.pk, 'dis' : sp.seller_s.seller.get_distance(quart), 'sp' : sp} for sp in sps
    ]
    sellers_ordered  = sorted(sellers_pk, key= lambda e : e['dis'])
    finals = [
        e['sp'] for e in sellers_ordered
    ]
    return finals
    
