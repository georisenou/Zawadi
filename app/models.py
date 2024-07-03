
from re import A
from xmlrpc.client import Boolean
import requests
from fcm_django.models import FCMDevice
from firebase_admin.messaging import Message as Mss, Notification, AndroidNotification, WebpushConfig, WebpushFCMOptions, AndroidConfig, APNSConfig, APNSPayload, Aps
import json
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils import timezone
from pyparsing import re
from .managers import CustomUserManager
import string
from django_email import djemail
import random
from haversine import haversine, Unit
all_characters = string.ascii_letters+string.digits+string.punctuation
characters = string.ascii_letters+string.digits

API_URL = "http://192.168.43.244:8000"

def get_slug(dem, seller):
    return f"{seller.pk}-{dem.pk}"

def get_value(key):
    return ZawadiDetail.objects.get(key=key).value

def default_image() :
    return ZawadiDetail.objects.get(key = 'default:cat').value

def get_user_token(user):
    token = AdminToken.objects.create(
        name=f"alert:{user.pk}", token=ident_generator(50, 90))
    return token.token


def checking_token(token):
    pk = 0
    adtkn = AdminToken.objects.filter(token=token, is_checked=False)
    if adtkn.exists():
        pk = int(adtkn.name.split(':')[1])
        ad_tok = adtkn.first()
        ad_tok.is_checked = True
        ad_tok.save()
    return adtkn.exists(), pk


def send_each_notif(seller, dem):
    djemail.send_email(
        to=seller.user.email,
        template="email/single_dem",
        context={
            'dem': dem,
            'seller': seller
        },
        subject="Zawadi | Alerte demande de {}".format(dem.subs.name)
    )


def send_email_notif(seller, dem):
    token = get_user_token(seller.user)
    djemail.send_email(
        to=seller.user.email,
        template="email/alert_output",
        context={
            'dem': dem,
            'seller': seller
        },
        subject="Zawadi | Nouvelle demande de {}".format(dem.subs.name)
    )


def send_email_finished_alert(seller, is_finished=True):
    token = get_user_token(seller.user)
    djemail.send_email(
        to=seller.user.email,
        template="email/finished" if is_finished else 'email/almost_finished',
        context={
            'seller': seller,
        },
        subject="Zawadi | Alerte d'expiration"
    )


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


PRICE_PER = 80

PRIORITY_REDUCTION = {
    'last': 0.04,
    'first': 0.20,
    'second': 0.10,
    'third':  0.05
}

OPTION_C = {
    'basique': 0.01,
    'pro': 0.05,
    'buisness': 0.1,
    'free': 0.08
}


MONTHS = ['Jan', 'Fev', 'Mars', 'Avr', 'Mai', 'Juin',
          'Juil', 'Août', 'Sept', 'Oct', 'Nov', 'Dec']


def ident_generator(min, max):
    length = random.randrange(min, max+1, 2)
    ident = []
    for x in range(length):
        ident.append(random.choice(characters))
    last_ident = ''.join(ident)
    return last_ident

# Create your models here.


class Parrain(models.Model):
    whatsapp = models.CharField(max_length=150, null=True, blank=True)
    full_name = models.CharField(max_length=250, null=True, blank=True)
    email = models.EmailField(null=True, blank=True)
    ident = models.CharField(null=True, blank=True,
                             max_length=150, unique=True)
    money = models.IntegerField(default=0, null=True, blank=True)
    current = models.IntegerField(default=0)
    status = models.BooleanField(default=True)
    tof = models.FileField(null=True, blank=True)
    act_err = models.TextField(null=True, blank=True)
    veracity = models.IntegerField(null=True, blank=True, default=100)
    
    def get_tof(self):
        return self.tof.url if self.tof else "/static/user.png"

    def get_dems(self):
        return self.dems.count()

    def __str__(self) -> str:
        return self.full_name

    def set_veracity(self):
        ver = 100
        if not self.dems.count():
            self.veracity = ver
            self.save()
            return 0
        real = int(self.dems.filter(sold=True).count()/self.get_dems())
        if real > 0.7:
            ver = 100
        elif real > 0.5:
            ver = 70
        elif real > 0.4:
            ver = 50
        elif real > 0.3:
            ver = 40
        else:
            ver = 30
        self.veracity = ver
        self.save()


class Retrait(models.Model):
    parrain = models.ForeignKey(
        Parrain, null=True, blank=True, on_delete=models.CASCADE, related_name="retraits")
    created_at = models.DateTimeField(auto_now_add=True)
    montant = models.IntegerField(null=True, blank=True)
    solded = models.BooleanField(default=False)

    def get_duration(self):
        duration = (timezone.now() - self.created_at)
        seconds = duration.total_seconds()
        if seconds < 60:
            return "a l'instant"
        elif seconds < 3600:
            return str(int(seconds / 60)) + " min"
        elif seconds < 24 * 3600:
            return str(int(seconds / 3600)) + " h"
        else:
            return str(int(seconds / (24*3600))) + " j"


class MyFiles(models.Model):
    name = models.CharField(max_length=150, null=True, blank=True)
    file = models.FileField(upload_to='demandes/', null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    def get_file(self) :
        return self.file.url
    def __str__(self):
        return self.name


class ZawadiDetail(models.Model):
    key = models.CharField(max_length=250, null=True, blank=True)
    value = models.TextField(null=True, blank=True)
    def __str__(self) -> str:
        return self.key


class User(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(max_length=150, null=True)
    email = models.EmailField(unique=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)
    first_name = models.CharField(max_length=150, null=True, blank=True)
    last_name = models.CharField(max_length=150, null=True, blank=True)
    quart = models.TextField(null=True, blank=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    objects = CustomUserManager()
    country = models.CharField(max_length=15, null=True, blank=True)
    towns = models.CharField(max_length=250, null=True, blank=True)
    def full_name(self) :
        return f"{self.first_name} {self.last_name}"
    def can_freed(self):
        sellers = self.accounts.count()
        return not sellers
    def get_quart(self) :
        return json.loads(self.quart)

class Client(models.Model):
    user = models.ForeignKey(User, null=True, blank=True,
                             on_delete=models.CASCADE, related_name="clients")
    point = models.IntegerField(default=0)
    whatsapp = models.CharField(max_length=200, null=True, blank=True)
    phone = models.CharField(null=True, blank=True, max_length=200)

    def __str__(self) -> str:
        return self.client

    def get_whatsapp(self):
        return self.whatsapp

    def get_phone(self):
        return self.phone

    def get_email(self):
        return self.user.email

    def get_complete_name(self):
        return f"{self.user.first_name} {self.user.last_name}"

    def __str__(self) -> str:
        return self.user.email


class Label(models.Model):
    name = models.CharField(max_length=150, null=True, blank=True)
    is_on = models.BooleanField(default=True)
    picture = models.OneToOneField(MyFiles, null=True, blank=True, on_delete=models.CASCADE)
    def get_picture(self) :
        return self.picture.file.url if self.picture else default_image()
    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(null=True, blank=True, max_length=250)
    label = models.ForeignKey(
        Label, on_delete=models.CASCADE, null=True, blank=True, related_name="cats")
    dprice = models.IntegerField(default=75)
    is_visible = models.BooleanField(default=True)
    picture = models.OneToOneField(MyFiles, null=True, blank=True, on_delete=models.CASCADE)
    prefix = models.CharField(max_length=150, null=True, blank=True)
    def get_picture(self) :
        return self.picture.file.url if self.picture else default_image()

    def __str__(self) -> str:
        return self.name


class SubCategory(models.Model):
    name = models.CharField(max_length=250, null=True, blank=True)
    is_visible = models.BooleanField(default=True)
    box = models.ForeignKey(
        Category, on_delete=models.CASCADE, null=True, blank=True, related_name="subs")
    sub_box = models.ForeignKey(
        "SubCategory", null=True, blank=True, related_name="subs", on_delete=models.CASCADE)
    prefix = models.CharField(max_length=150, null=True, blank=True)
    default_price = models.IntegerField(null=True, blank=True, default=2500)
    picture = models.OneToOneField(MyFiles, null=True, blank=True, on_delete=models.CASCADE)
    def get_name(self) :
        pref = "" if not self.get_pref() else f"{self.get_pref()} "
        return pref + self.name
    def get_pref(self) -> str :
        if self.box :
            return self.box.prefix
        else :
            return self.sub_box.prefix if self.sub_box.prefix else self.sub_box.box.prefix
    def get_recoms(self) :
        if self.sub_box :
            return [
                sub.pk for sub in self.sub_box.subs.all()
            ]
        else :
            return []
    def get_default_price(self) :
        if self.sub_box:
            return self.default_price
        else :
            d_price = 0
            for s in self.subs.all() :
                d_price += s.default_price
            return d_price / self.subs.count()
            
    def get_picture(self) :
        return self.picture.file.url if self.picture else default_image()
    def __str__(self) -> str:
        return self.name
    def get_cat(self) :
        return self.box if self.box else self.sub_box.box
    def get_subs(self):
        return self.subs.all()

    def is_subs(self):
        return Boolean(self.sub_box)

    def get_box(self):
        return self.sub_box.box.pk if self.sub_box else self.box.pk

    def get_dprice(self):
        return Category.objects.get(pk=self.get_box()).dprice


class ClientDemand(models.Model):
    client = models.ForeignKey(
        Client, null=True, blank=True, on_delete=models.CASCADE, related_name="demandes")
    created_at = models.DateTimeField(auto_now_add=True)
    date = models.DateField(auto_now_add=True, null=True)
    category = models.ForeignKey(
        Category, null=True, blank=True, on_delete=models.CASCADE, related_name="demandes")
    subs = models.ForeignKey(SubCategory, null=True, blank=True,
                             on_delete=models.CASCADE, related_name="demandes")
    emergency = models.CharField(max_length=250, null=True, blank=True)
    budget = models.CharField(max_length=150, null=True, blank=True)
    detail = models.TextField(null=True, blank=True)
    point = models.IntegerField(default=0)
    is_out = models.BooleanField(default=False)
    num = models.IntegerField(null=True, blank=True)
    files = models.ManyToManyField(MyFiles, blank=True)
    num_vend = models.IntegerField(default=3)
    quart = models.TextField(null=True, blank=True)
    slug = models.TextField(null=True, blank=True)
    state = models.CharField(max_length=100, null=True, blank=True)
    clicked = models.ManyToManyField(
        "SellerAccount", related_name="has_clicked", blank=True)
    parrain = models.ForeignKey(
        Parrain, null=True, blank=True, on_delete=models.CASCADE, related_name="dems")
    sold = models.BooleanField(default=False)
    def a_contacte(self, seller) :
        return seller in self.clicked.all()
    def a_ete_notifie(self, seller) :
        logs = ZawadiDetail.objects.get(key = "whatsapp_logs")
        slug = get_slug(self, seller)
        return f"$${slug}:<!0" in logs.value
    def get_quart(self):
        return json.loads(self.quart)

    def getbdg(self):
        return f"{self.budget} F" if self.budget else '-:-'

    def get_files(self):
        return [
            file.file.url for file in self.files.all()
        ]

    def has_files(self):
        return len(self.get_files())

    def sends_num(self):
        return self.weeks_in.count()

    def get_duration(self):
        duration = (timezone.now() - self.created_at)
        seconds = duration.total_seconds()
        if seconds < 60:
            return "a l'instant"
        elif seconds < 3600:
            return str(int(seconds / 60)) + " min"
        elif seconds < 24 * 3600:
            return str(int(seconds / 3600)) + " h"
        else:
            return str(int(seconds / (24*3600))) + " j"

    def __str__(self) -> str:
        return f'Client{self.pk}'


class SellerAccount(models.Model):
    user = models.ForeignKey(User, null=True, blank=True,
                             on_delete=models.CASCADE, related_name="accounts")
    name = models.CharField(max_length=250, null=True, blank=True)
    rest = models.IntegerField(default=0)
    abn_count = models.IntegerField(default=0)
    last_abn = models.DateTimeField(null=True, blank=True)
    created_at = models.DateField(auto_now_add=True, null=True, blank=True)
    category = models.ManyToManyField(
        Category, null=True, blank=True, related_name="sellers")
    subs = models.ManyToManyField(
        SubCategory, related_name="sellers", blank=True)
    count = models.BigIntegerField(default=0)
    picture = models.FileField(upload_to='accounts/', null=True, blank=True)
    type_of = models.CharField(max_length=150, null=True, blank=True)
    speed = models.IntegerField(default=0)
    expired_date = models.DateField(null=True, blank=True)
    has_freed = models.BooleanField(default=False)
    whatsapp = models.CharField(max_length=150, null=True, blank=True)
    dprice = models.IntegerField(null=True, blank=True, default=50)
    damount = models.IntegerField(null=True, blank=True, default=250)
    damount_init = models.IntegerField(null=True, blank=True, default=250)
    dm_alert = models.BooleanField(default=False)
    format_number = models.CharField(max_length=100, null=True, blank=True)
    
    def send_test_notif(self, typeof='email'):
        if typeof == 'email':
            djemail.send_email(
                to=self.user.email,
                template="email/test",
                context={
                    'seller': self
                },
                subject="Zawadi | Test de de notifications"
            )

    def get_total_client(self) -> int:
        weeks = self.weeks.all()
        num = 0
        for w in weeks:
            num += w.demandes.count()
        return num

    def already_receive(self, dem):
        weeks = self.weeks.all()
        exists = False
        for w in weeks:
            if dem in w.demandes.all():
                exists = True
        print(exists, dem.pk)
        return exists

    def contains_sub(self, sub):
        return sub in self.subs.all()

    def get_last_abn(self):
        return self.abns.order_by('-created_at').first()

    def get_week(self):
        return self.weeks.all().filter(is_on=True).order_by('-begun').first()

    def __str__(self) -> str:
        return self.name

    def get_picture(self):
        return self.picture.url if self.picture else ZawadiDetail.objects.get(key='default:shop:picture:url').value

    def is_freeing(self):
        return self.type_of == 'free' 

    def get_latlng(self):
        print(self.user.quart)
        quart = json.loads(self.user.quart)
        return quart

    def add_dem(self, dem):
        if not self.already_receive(dem):
            self.get_week().demandes.add(dem)
            max_try = 10
            send_whatsapp_notif(self, dem)
            try:
                send_notif(self)
                send_email_notif(self, dem=dem)
                if self.dm_alert:
                    send_each_notif(seller=self, dem=dem)
            except Exception as e:
                print('Mail exception => ', e)
            self.damount -= self.dprice
            self.save()
            if self.damount <= self.damount_init * 0.2 and self.damount > 0:
                try:
                    send_email_finished_alert(seller=self, is_finished=False)
                except Exception as e:
                    print('Almost finished mail exception => ', e)
            elif self.damount <= 0:
                try:
                    send_email_finished_alert(self)
                except Exception as e:
                    print('Finished mail exception => ', e)
                self.rest = 0
                self.save()
        if dem.weeks_in.count() >= dem.num_vend and (not dem.is_out):
            dem.is_out = True
            dem.save()

    def get_sent_dem(self):
        return int((self.damount_init - self.damount)/self.dprice)

    def get_all_dem(self):
        return int(self.damount_init / self.dprice)

    def get_distance(self, quart) -> int :
        me = self.get_latlng()['lat'], self.get_latlng()['lng']
        dem = quart['lat'], quart['lng']
        return haversine(me, dem)

    def r_price(self, price):
        return price - price * (PRIORITY_REDUCTION[self.get_week().get_level()] + OPTION_C[self.type_of])


class WeekCustom(models.Model):
    seller = models.ForeignKey(
        SellerAccount, null=True, blank=True, related_name="weeks", on_delete=models.CASCADE)
    begun = models.DateField(null=True, blank=True)
    end = models.DateField(null=True, blank=True)
    demandes = models.ManyToManyField(
        ClientDemand, blank=True, related_name="weeks_in")
    is_on = models.BooleanField(default=True)
    prev = models.IntegerField(default=0)
    next = models.IntegerField(default=0)
    max = models.IntegerField(default=0)
    max_urg = models.IntegerField(default=0)

    def get_title(self):
        return f"{self.begun.day} {MONTHS[self.begun.month - 1]} - {self.end.day} {MONTHS[self.end.month - 1]} {self.end.year}"

    def __str__(self) -> str:
        return self.seller.name + f":week:{self.pk}"

    def get_level(self):
        count = self.seller.get_sent_dem()
        ls = self.get_steps()
        if count < ls[0]:
            return 'first'
        elif count < ls[1]:
            return 'second'
        elif count < ls[2]:
            return 'third'
        else:
            return 'last'

    def get_steps(self):
        all_dem = self.seller.get_all_dem()
        return [int(all_dem / 4), int(all_dem/2), 3 * int(all_dem/4), all_dem]
        """
        if self.seller.type_of == 'basique' :
            return [4, 10, 15]
        elif self.seller.type_of == 'pro' :
            return [6, 16, 31]
        elif self.seller.type_of == 'buisness' :
            return [15, 20, 61]
        elif self.seller.type_of == 'free' :
            return [10, 25, 60]
        """


class Feedback(models.Model):
    user = models.CharField(max_length=250, null=True, blank=True)
    seller = models.CharField(max_length=250, null=True, blank=True)
    picture = models.FileField(null=True, blank=True, upload_to='feedback/')
    text = models.TextField(max_length=250, null=True, blank=True)
    rank = models.IntegerField(default=1)

    def __str__(self) -> str:
        return self.seller

    def get_picture(self):
        return self.picture.url if self.picture else ZawadiDetail.objects.get(key='default:shop:picture:url').value


class AdminToken(models.Model):
    name = models.CharField(max_length=150, null=True, blank=True)
    token = models.TextField(null=True, blank=True)
    is_checked = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class AbnFeature(models.Model):
    seller = models.ForeignKey(
        SellerAccount, null=True, blank=True, on_delete=models.CASCADE, related_name="abns")
    type_of = models.CharField(null=True, blank=True, max_length=150)
    total = models.IntegerField(default=0)
    total_urg = models.IntegerField(default=0)
    created_at = models.DateField(auto_now_add=True)
    transaction_id = models.TextField(null=True, blank=True)
    count = models.IntegerField(default=0)
    expired_date = models.DateField(null=True, blank=True)
    is_freed = models.BooleanField(default=False)


class UserGame(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="games", null=True, blank=True)
    value1 = models.CharField(max_length=150, null=True, blank=True)
    value2 = models.CharField(max_length=150, null=True, blank=True)
    day = models.DateField(auto_now_add=True)

    def __str__(self) -> str:
        return f"{self.day} - {self.user}"


def replace(key, targ, allstring):
    return allstring.replace(key, targ)


def create_cats(ls):
    old = Label.objects.all()
    old.delete()
    for l in ls:
        name = list(l.keys())[0]
        label = Label.objects.create(name=name)
        print('Done --> ', name)
        for c in l[name]:
            name = list(c.keys())[0]
            cat = Category.objects.create(name=name)
            label.cats.add(cat)
            print('Done --> ', name)
            for s in c[name]:
                names = s.split(':')
                sub = SubCategory.objects.create(name=names[0], box=cat)
                if len(names) == 2:
                    sub.default_price = int(names[1])
                sub.save()
                print('Done --> ', s)
    print('All Done !')


def extract_cats():
    print('Opening Zawadi Categories file ...')
    f = open('categorie_zawadi')
    print('Opened !')
    l = f.readlines()
    l = [
        replace("\n", "", p) for p in l
    ]
    ls = []
    for p in l:
        ex = {}
        if p[0] != "\t":
            ex[p] = []
            ls.append(ex)
        elif p[0] == "\t" and p[1] != "\t":
            n = ls[-1]
            #n[list(n.keys())[0]].append(replace("\t", "", p))
            ex = {}
            ex[replace("\t", "", p)] = []
            n[list(n.keys())[0]].append(ex)
        else:
            n = ls[-1]
            label = n[list(n.keys())[0]]
            my = label[-1]
            myl = my[list(my.keys())[0]].append(replace("\t\t", "", p))
    create_cats(ls)
    print('Closing Zawadi Categories file ...')
    f.close()
    print('Closed !!')


def get_lis(name):
    return name.split(":")


def install_all_cats(is_real=False):
    if is_real:
        print("Deleting all cats ", Category.objects.all().delete())
        print("Deleting all labels ", Label.objects.all().delete())
        print("Deleting all subs ", SubCategory.objects.all().delete())
    print('Opening Zawadi Categories file ...')
    f = open('categorie_zawadi')
    print('Opened !')
    lines = [
        replace("\n", "", p) for p in f.readlines()
    ]
    cur_label = 0
    cur_cat = 0
    cur_sub = 0
    for line in lines:
        if "\t\t\t" in line:
            name = line[3:]
            subsub = SubCategory.objects.create(name=get_lis(
                name)[0], sub_box=SubCategory.objects.get(pk=cur_sub))
            if len(get_lis(name)) > 1:
                subsub.default_price = int(get_lis(name)[1])
                subsub.save()
            print(f'\t\t\tDone SubSub --> {subsub.name}')
        elif "\t\t" in line:
            name = line[2:]
            sub = SubCategory.objects.create(name=get_lis(
                name)[0], box=Category.objects.get(pk=cur_cat))
            if len(get_lis(name)) > 1:
                sub.default_price = int(get_lis(name)[1])
                sub.save()
            cur_sub = sub.pk
            print(f'\t\tDone Sub --> {sub.name}')
        elif "\t" in line:
            name = line[1:]
            cat = Category.objects.create(
                name=name, label=Label.objects.get(pk=cur_label))
            cur_cat = cat.pk
            print(f'\tDone Cat --> {cat.name}')
        else:
            name = line
            label = Label.objects.create(name=name)
            cur_label = label.pk
            print(f'Done Label --> {label.name}')
    f.close()
    print('Files closed')


try : 
    PHONE_NUMBER_ID = get_value('WHATSAPP_PHONE_NUMBER_ID')

    ACCESS_TOKEN = get_value('WHATSAPP_ACCESS_TOKEN')

except :
    PHONE_NUMBER_ID =""

    ACCESS_TOKEN = ""
    print("DATABASE NOT READY YET...")

ENDPOINT = f'https://graph.facebook.com/v15.0/{PHONE_NUMBER_ID}/messages'

HEADERS = {
        'Authorization': f'Bearer {ACCESS_TOKEN}',
    'Content-Type': 'application/json'
}


def send_messages(data, slug, can_log=True):
    resp = requests.post(url=ENDPOINT, headers=HEADERS, data=data)
    if can_log:
        logs = ZawadiDetail.objects.get(key='whatsapp_logs')
        print(resp.status_code, resp.content)
        logs.value += f"$${slug}:<!0{str(resp.content)}0!>"
        logs.save()
    else:
        print(f"\t {resp.content}")
    return resp


def get_slug(dem, seller):
    return f"{seller.pk}-{dem.pk}"

def get_message_data(dem, seller):
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{seller.format_number}",
        "type": "text",
        "text": {
            "preview_url": True,
            "body": f"*Nouvelle demande de {dem.subs.name}* \n Veuillez repondre à la demande du client. https://vendeur.zawadi.site/clients/0/"
        }
    }
    return json.dumps(data)


def get_welcome_message(seller):
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{seller.format_number}",
        "type": "template",
        "template": {
            "name": "welcomed_zawadi",
            "language": {
                "code": "fr"
            }
        }
    }
    return json.dumps(data)


def get_alertwha_message(number):
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{number}",
        "type": "template",
        "template": {
            "name": "welcomed_zawadi",
            "language": {
                "code": "fr"
            }
        }
    }
    return json.dumps(data)


def get_market_seller_message(name, seller):
    file = MyFiles.objects.get(name = name)
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{seller.format_number}",
        "type": "template",
        "template": {
            "name": "bonus_prog",
            "language": {
                "code": "fr"
            },
            "components": [
                {
                    "type": "header",
                    "parameters": [
                        {
                            "type": "image",
                            "image": {
                                "link": "https://res.cloudinary.com/achat-en-gros/image/upload/v1/media/demandes/png_20230208_153425_0000_s3f662",
                            }
                        }
                    ]
                },
                {
                    "type": "body",
                    "parameters": [
                        {
                            "type": "text",
                            "text" : "Somme",
                        }
                    ]
                },
            ]
        }
    }
    return json.dumps(data)

def get_market_client_message(number):
    file = MyFiles.objects.get(name = "market1")
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{number}",
        "type": "template",
        "template": {
            "name": "new_do",
            "language": {
                "code": "fr"
            },
            "components": [
                {
                    "type": "header",
                    "parameters": [
                        {
                            "type": "image",
                            "image": {
                                "link": "https://res.cloudinary.com/achat-en-gros/image/upload/v1/media/demandes/sample_jqnbvg",
                            }
                        }
                    ]
                }
            ]
        }
    }
    return json.dumps(data)

def get_patner_data( patner) :
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{patner.whatsapp}",
        "type": "template",
        "template": {
            "name": "patner_dem",
            "language": {
                "code": "fr"
            }
        }
    }
    return json.dumps(data)

def get_payment_template(amount , f_name, number ) :
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{number}",
        "type": "template",
        "template": {
            "name": "seller_pay",
            "language": {
                "code": "fr"
            },
            "components": [
                {
                    "type": "header",
                    "parameters": [
                        {
                            "type": "text",
                            "text": f"{amount} FCFA"
                        }
                    ]
                },
                {
                    "type": "body",
                    "parameters": [
                        {
                            "type": "text",
                            "text": f"{amount} FCFA"
                        },
                        {
                            "type": "text",
                            "text": f"{f_name}"
                        }
                    ]
                }
            ]
        }
    }
    return json.dumps(data)


def get_template_message_data(dem, seller):
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{seller.format_number}",
        "type": "template",
        "template": {
            "name": "demand_alert",
            "language": {
                "code": "fr"
            },
            "components": [
                {
                    "type": "body",
                    "parameters": [
                        {
                            "type": "text",
                            "text": f"{dem.subs.name}"
                        }
                    ]
                }
            ]
        }
    }
    return json.dumps(data)


def send_whatsapp_notif(seller, dem):
    if seller.format_number:
        resp = send_messages(get_template_message_data(
            dem, seller), get_slug(dem, seller))
        return resp

