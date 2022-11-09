
import datetime
import json
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from app.models import AbnFeature, Category, ClientDemand, Feedback, SellerAccount, SubCategory, User, UserGame, WeekCustom, ZawadiDetail, Client
from django.contrib.auth import login, authenticate, logout
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django.db import transaction
from rest_framework.permissions import IsAuthenticated
from .core import Kkiapay
from django.db.models import Count, Max, Min
import threading
from firebase_admin.messaging import Message as Mss, Notification, AndroidNotification, WebpushConfig, WebpushFCMOptions, AndroidConfig, APNSConfig, APNSPayload, Aps
from fcm_django.models import FCMDevice
# Create your views here.


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
            link=f"{get_value('site:link')}/mydiscuss/")
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


def get_on_week(seller):
    weeks = seller.weeks.filter(is_on=True)
    if weeks.exists():
        return weeks.first()
    else:
        if seller.rest:
            return create_week(seller)


def add_client_to_week(client, week):
    week.demandes.add(client)
    check_is_out(client)
    check_week(week)
    week.seller.count += 1
    week.seller.save()
    send_notif(week.seller)


def check_week(week):
    if week.demandes.all().count() >= week.max or week.seller.rest == 0:
        week.is_on = False
        week.save()
    return week


def send_client_to_seller(client):
    sellers = SellerAccount.objects.filter(
        rest__gt=0, category=client.category)
    seller_pks = [
        seller.pk for seller in sellers if (client.subs in seller.subs.all() and (len(merge_list(seller.user.towns.split(':'), client.client.user.towns.split(':')))))
    ]
    fsellers = SellerAccount.objects.filter(pk__in=seller_pks)
    first_pk = [
        s.pk for s in fsellers if get_on_week(s).get_level() == 'first'
    ]
    second_pk = [
        s.pk for s in fsellers if get_on_week(s).get_level() == 'second'
    ]
    third_pk = [
        s.pk for s in fsellers if get_on_week(s).get_level() == 'third'
    ]
    first_pk = first_pk + second_pk + third_pk
    print(first_pk)
    for pk in first_pk:
        if not client.is_out:
            add_client_to_week(client, get_on_week(
                SellerAccount.objects.get(pk=pk)))


def get_value(key):
    return ZawadiDetail.objects.get(key=key).value


def create_week(seller):
    for week in seller.weeks.all():
        week.is_on = False
        week.save()

    week = WeekCustom.objects.create(seller=seller)
    week.begun = datetime.date.today()
    week.end = datetime.date.today() + datetime.timedelta(days=7)
    last_week = seller.weeks.exclude(pk=week.pk).order_by('-end')
    if last_week:
        last_week.next = week.pk
        last_week.save()
        week.prev = last_week.pk
        week.save()
    week.max = int(get_value(seller.type_of + ':max'))
    week.max_urg = int(get_value(seller.type_of + ':max_urg'))
    week.save()
    return week


def check_seller(seller):
    if seller.expired_date < datetime.date.today():
        seller.rest = 0
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
    return render(request, 'index.html', {
        'root': 'home',
        'feeds': feeds[:7],
        'contact': contact,
        'has_submit': has_submit
    })


@login_required(login_url='/login')
def clients(request, pk):
    seller = request.user.accounts.all().first()
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
        'can_notif': can_notif
    })


def login_view(request):
    err = []
    contact = ZawadiDetail.objects.get(key='contact:home')
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            user = authenticate(email=email, password=password)
            print(user)
            if user:
                login(request, user)
                next = request.GET.get('next')
                if next:
                    redirect(next)
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
        towns = post['towns[]']
        users = User.objects.filter(email=email)
        if users.exists():
            err.append('Cet email a déjà été utilisé.')
            return render(request, 'register.html', {
                'err': err
            })
        try:
            user = User.objects.create_user(email=email, password=password, first_name=first_name,
                                            last_name=last_name, country=country, towns=':'.join(towns))
        except:
            err.append(
                'Une erreur est survenue. Veuillez vérifier vos identifiants.')
            return render(request, 'register.html', {
                'err': err
            })
        login(request, user)
        return redirect('index')
    return render(request, 'register.html', {
        'err': err
    })


@login_required(login_url='/login')
def activate(request):
    seller = request.user.accounts.all().first()
    categories = Category.objects.all()
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
        'categories': categories,
        'token': ZawadiDetail.objects.get(key='kkiapay_public').value
    })


@login_required(login_url='/login')
def very_new_activate(request):
    seller = request.user.accounts.all().first()
    categories = Category.objects.all()
    return render(request, 'activate2.html', {
        'seller': seller,
        'categories': categories,
        'token': ZawadiDetail.objects.get(key='kkiapay_public').value
    })


@login_required(login_url='/login')
def compte(request):
    seller = request.user.accounts.all().first()
    categories = Category.objects.all()
    has_modif = False
    err = []

    if request.method == 'POST':
        image = request.FILES.get('image')
        if image:
            seller.picture = image
            seller.save()
        else:
            try:
                name = request.POST.get('name')
                category = request.POST.get('category')
                subs = dict(request.POST)['subs[]']
                subs = SubCategory.objects.filter(name__in=subs)
                print(subs)
                first_name = request.POST.get('first_name')
                last_name = request.POST.get('last_name')
                email = request.POST.get('email')
                password = request.POST.get('password')
                if request.user.check_password(password):
                    request.user.first_name = first_name
                    request.user.last_name = last_name
                    request.user.email = email
                    request.user.save()
                    cat = Category.objects.get(pk=int(category))
                    seller.name = name
                    seller.category = cat
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
        'has_modif': has_modif
    })


def customers(request):
    zawadi = get_value('zawadi')
    categories = Category.objects.all()
    has_user = request.user.is_authenticated
    cat_first = categories.first().pk
    feeds = Feedback.objects.all().order_by('rank')[:4]
    demandes = []
    if has_user:
        demandes = ClientDemand.objects.filter(
            client__user=request.user).order_by('-created_at')[:15]
    return render(request, 'client_app/index.html', {
        'zawadi': zawadi,
        'categories': categories,
        'f': cat_first,
        'dems': demandes,
        'count': len(demandes),
        'feeds': feeds,
        'has_user': has_user and Client.objects.filter(user=request.user).exists()
    })


@api_view(["GET", "POST"])
@permission_classes([IsAuthenticated])
def activ_abn(request):
    seller = SellerAccount.objects.get_or_create(user=request.user)[0]
    if request.method == 'POST':
        name = request.POST.get('name')
        cat = request.POST.get('cat')
        subs = json.loads(request.POST.get('subs'))
        choice = request.POST.get('choice')
        total = request.POST.get('total')
        transaction = request.POST.get('transaction')
        k = Kkiapay(get_value('kkiapay_public'), get_value(
            'kkiapay_private'), get_value('kkiapay_secret'))
        trans = k.verify_transaction(transaction_id=transaction)
        if trans.status == "SUCCESS":
            seller.name = name
            seller.category = Category.objects.get(pk=int(cat))
            for s in seller.subs.all():
                seller.subs.remove(s)
            for s in SubCategory.objects.filter(name__in=subs):
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
@permission_classes([IsAuthenticated])
def register_demand(request):
    if not request.user.is_authenticated:
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        country = request.POST.get('country')
        town = request.POST.get('town')
        number = request.POST.get('number')
        whatsapp = request.POST.get('whatsapp')
        user = User.objects.get_or_create(
            first_name=first_name, last_name=last_name, country=country, towns=":".join(json.loads(town)))[0]
        try:
            user.email = email
            user.save()
        except:
            try:
                user.email = first_name + email
                user.save()
            except:
                user.email = last_name + first_name + email
                user.save()
        user.set_password(first_name + last_name + number)
        login(request, user)
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
    pks = []
    for sub in subs:
        demand = ClientDemand.objects.create(
            client=client, subs=SubCategory.objects.get(name=sub), category = Category.objects.get(pk = int(cat)), emergency=emer)
        pks.append(demand.pk)

    def send_dem():
        dems = ClientDemand.objects.filter(pk__in=pks)
        for dem in dems:
            send_client_to_seller(dem)
    send_by_thread(send_dem)
    return Response({
        'done': True,
        'result': pks
    })


def daily_task(request):
    mess = "Reussite !! "
    mess2 = " - Reusite"
    try:
        sellers = SellerAccount.objects.all()
        for seller in sellers:
            seller = check_seller(seller)
            for week in seller.weeks.all():
                week = check_week_(week)
        
    except Exception as e:
        mess = e
    try :
        demandes = ClientDemand.objects.annotate(weeks = Count('weeks_in')).filter(weeks = 0)
        for dem in demandes :
            send_client_to_seller(dem)
    except Exception as e :
        mess2 = f" - {e}"
    return render(request, 'daily_task.html', {
        "mess": mess + mess2
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
