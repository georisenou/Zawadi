from .models import PRICE_PER, ClientDemand, SellerAccount, ZawadiDetail



def get_all_dems(slug_dem) :
    return ClientDemand.objects.filter(slug = slug_dem)

def get_macthed_sellers(dems) :
    pks = []
    subs = [
        dem.subs.pk for dem in dems
    ]
    sellers = SellerAccount.objects.filter(rest__gt=0)
    for seller in sellers :
        for sub in seller.subs.all() :
            if sub.pk in subs :
                if not seller.pk in pks :
                    pks.append(seller.pk)
    return SellerAccount.objects.filter(pk__in =pks)

def get_price_spent(seller, dems) :
    price = PRICE_PER * seller.get_distance(dems[0].get_quart())
    for dem in dems :
        price += seller.r_price(dem.subs.default_price )
        if not dem.subs in seller.subs.all() :
            price += (seller.get_distance(dems[0].get_quart()) / 8) * PRICE_PER
    
    print(f'Pass for seller {seller.name} => {price}')
    return price

def order_list(list) :
    return sorted(list, key= lambda e : e['spent'])

def build_list(dems) :
    lis = []
    sellers = get_macthed_sellers(dems)
    for seller in sellers :
        lis.append({
            'pk' : seller.pk,
            'spent' : get_price_spent(seller, dems)
        })
    print('Order passed ==> ', lis)
    return lis

def main(dem_slug) :
    all_dems = get_all_dems(dem_slug)
    lis = order_list(build_list(all_dems))
    for dem in all_dems :
        for seller in lis :
            seller = SellerAccount.objects.get(pk = seller['pk'])
            new_dem = ClientDemand.objects.get(pk = dem.pk)
            if not new_dem.is_out :
                if seller.contains_sub(dem.subs) and seller.rest :
                    seller.add_dem(new_dem)
                    
    return 0

