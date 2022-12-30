
import json
from xmlrpc.client import Boolean
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils import timezone
from .managers import CustomUserManager
import string
import random
from haversine import haversine, Unit
all_characters = string.ascii_letters+string.digits+string.punctuation
characters = string.ascii_letters+string.digits
from firebase_admin.messaging import Message as Mss, Notification, AndroidNotification, WebpushConfig, WebpushFCMOptions, AndroidConfig, APNSConfig, APNSPayload, Aps
from fcm_django.models import FCMDevice

def get_value(key):
    return ZawadiDetail.objects.get(key=key).value

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
    'free' : 0.25,
    'first' : 0.20,
    'second' : 0.10,
    'third' :  0.5
}

MONTHS = ['Jan', 'Fev', 'Mars', 'Avr', 'Mai', 'Juin', 'Juil', 'Août', 'Sept' ,'Oct', 'Nov', 'Dec']

def ident_generator(min, max):
    length = random.randrange(min, max+1, 2)
    ident = []
    for x in range(length):
        ident.append(random.choice(characters))
    last_ident = ''.join(ident)
    return last_ident

# Create your models here.

class MyFiles(models.Model) :
    name = models.CharField(max_length=150, null=True, blank=True)
    file = models.FileField(upload_to='demandes/', null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    def __str__( self) :
        return self.name

class ZawadiDetail(models.Model) :
    key = models.CharField(max_length=250, null=True, blank=True)
    value = models.TextField(null=True, blank=True)
    def __str__(self) -> str:
        return self.key

class User(AbstractBaseUser, PermissionsMixin) :
    username = models.CharField(max_length=150, null=True)
    email = models.EmailField( unique=True)
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
    def can_freed(self) :
        sellers = self.accounts.count()
        return not sellers



class Client(models.Model) :
    user = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name="clients")
    point = models.IntegerField(default=0)
    whatsapp = models.CharField(max_length=200, null=True, blank=True)
    phone = models.CharField(null=True, blank=True, max_length=200)
    def __str__(self) -> str:
        return self.client
    def get_whatsapp(self) :
        return self.whatsapp
    def get_phone(self) :
        return self.phone
    def get_email(self) :
        return self.user.email
    def get_complete_name(self) :
        return f"{self.user.first_name} {self.user.last_name}"
    def __str__(self) -> str:
        return self.user.email
    
class Label(models.Model) :
    name = models.CharField(max_length=150, null=True, blank=True)
    is_on = models.BooleanField(default=True)
    def __str__(self) :
        return self.name

class Category(models.Model) :
    name = models.CharField(null=True, blank=True, max_length=250)
    label = models.ForeignKey(Label, on_delete=models.CASCADE, null=True, blank=True, related_name="cats")
    is_visible = models.BooleanField(default=True)
    def __str__(self) -> str:
        return self.name

class SubCategory( models.Model) :
    name = models.CharField(max_length=250, null=True, blank=True)
    is_visible = models.BooleanField(default=True)
    box = models.ForeignKey( Category,on_delete=models.CASCADE, null=True, blank=True, related_name="subs")
    sub_box = models.ForeignKey("SubCategory", null=True, blank=True, related_name="subs", on_delete=models.CASCADE)
    default_price = models.IntegerField(null=True, blank=True, default=2500)
    def __str__(self) -> str:
        return self.name
    def get_subs(self) :
        return self.subs.all()
    def is_subs(self) :
        return Boolean(self.sub_box)

class ClientDemand(models.Model) :
    client = models.ForeignKey(Client, null=True, blank=True, on_delete=models.CASCADE, related_name="demandes")
    created_at = models.DateTimeField(auto_now_add=True)
    date = models.DateField(auto_now_add= True, null=True)
    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.CASCADE, related_name="demandes")
    subs = models.ForeignKey(SubCategory, null=True, blank=True, on_delete=models.CASCADE, related_name="demandes")
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
    def get_quart(self) :
        return json.loads(self.quart)
    def get_files(self) :
        return [
            file.file.url for file in self.files.all()
        ]
    def has_files(self) :
        return len(self.get_files())
    def sends_num(self) :
        return self.weeks_in.count()
    def get_duration(self):
        duration = (timezone.now() - self.created_at)
        seconds = duration.total_seconds()
        if seconds < 60:
            return "0 min"
        elif seconds < 3600:
            return  str(int(seconds / 60)) + " min"
        elif seconds < 24 * 3600:
            return  str(int(seconds / 3600)) + " h"
        else:
            return  str(int(seconds / (24*3600))) + " j"
    def __str__(self) -> str:
        return f'Client{self.pk}'

class SellerAccount(models.Model) :
    user = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name="accounts")
    name = models.CharField(max_length=250, null=True, blank=True)
    rest = models.IntegerField(default=0)
    abn_count = models.IntegerField(default=0)
    last_abn = models.DateTimeField(null=True, blank=True)
    created_at = models.DateField(auto_now_add= True, null=True, blank=True)
    category = models.ManyToManyField(Category, null=True, blank=True, related_name="sellers")
    subs = models.ManyToManyField(SubCategory, related_name="sellers", blank=True)
    count = models.BigIntegerField(default=0)
    picture = models.FileField(upload_to='accounts/', null=True, blank=True)
    type_of = models.CharField(max_length=150, null=True, blank=True)
    speed = models.IntegerField(default=0)
    expired_date = models.DateField(null=True, blank=True)
    has_freed = models.BooleanField(default=False)
    whatsapp = models.CharField(max_length=150, null=True, blank=True)
    def get_total_client(self) -> int :
        weeks = self.weeks.all()
        num = 0
        for w in weeks : num += w.demandes.count()
        return num
    def contains_sub(self ,sub) :
        return sub in self.subs.all()
    def get_last_abn(self) :
        return self.abns.order_by('-created_at').first()
    def get_week(self) :
        return self.weeks.all().filter(is_on= True).first()
    def __str__(self) -> str:
        return self.name
    def get_picture(self) :
        return self.picture.url if self.picture else ZawadiDetail.objects.get(key = 'default:shop:picture:url').value
    def is_freeing(self) :
        return self.get_last_abn().is_freed
    def get_latlng(self) :
        quart = json.loads(self.user.quart)
        return quart
    def add_dem(self, dem) :
        if not dem in self.get_week().demandes.all() :
            self.get_week().demandes.add(dem)
            send_notif(self)
        if dem.weeks_in.count() >= dem.num_vend and (not dem.is_out) :
            dem.is_out = True
            dem.save()
    def get_distance(self, quart) :
        me = self.get_latlng()['lat'], self.get_latlng()['lng']
        dem = quart['lat'], quart['lng']
        return haversine(me, dem)
    
    def r_price(self, price) :
        return price - price * PRIORITY_REDUCTION[self.get_week().get_level()]


class WeekCustom(models.Model) :
    seller = models.ForeignKey(SellerAccount, null=True, blank=True, related_name="weeks", on_delete=models.CASCADE)
    begun = models.DateField(null=True, blank=True)
    end = models.DateField(null=True, blank=True)
    demandes = models.ManyToManyField(ClientDemand, blank=True, related_name="weeks_in")
    is_on = models.BooleanField(default=True)
    prev = models.IntegerField(default=0)
    next = models.IntegerField(default=0) 
    max = models.IntegerField(default=0)
    max_urg = models.IntegerField(default=0)

    def get_title(self) :
        return f"{self.begun.day} {MONTHS[self.begun.month - 1]} - {self.end.day} {MONTHS[self.end.month - 1]} {self.end.year}"
    def __str__(self) -> str:
        return self.seller.name + f":week:{self.pk}"
    def get_level(self) :
        count = self.demandes.count()
        ls = self.get_steps()
        last_abn = self.seller.get_last_abn()
        if last_abn.is_freed and count < ls[0] :
            return 'free'
        if count < ls[0] :
            return 'first'
        elif count < ls[1] :
            return 'second'
        elif count < ls[2] :
            return 'third'

    def get_steps(self) :
        if self.seller.type_of == 'basique' :
            return [4, 10, 15]
        elif self.seller.type_of == 'pro' :
            return [6, 16, 31]
        elif self.seller.type_of == 'buisness' :
            return [9, 20, 61]
        elif self.seller.type_of == 'free' :
            return [10, 25, 60]


class Feedback(models.Model) :
    user = models.CharField(max_length=250, null=True, blank=True)
    seller = models.CharField(max_length=250, null=True, blank=True)
    picture = models.FileField(null=True, blank=True, upload_to='feedback/')
    text = models.TextField(max_length=250, null=True, blank=True)
    rank = models.IntegerField(default=1)
    def __str__(self) -> str:
        return self.seller
    def get_picture(self) :
        return self.picture.url if self.picture else ZawadiDetail.objects.get(key = 'default:shop:picture:url').value

class AdminToken(models.Model) :
    name = models.CharField(max_length=150, null=True, blank=True)
    token = models.TextField(null=True, blank=True)
    is_checked = models.BooleanField(default=False)
    def __str__(self) :
        return self.for_

class AbnFeature(models.Model) :
    seller = models.ForeignKey(SellerAccount, null=True, blank=True, on_delete=models.CASCADE, related_name="abns")
    type_of = models.CharField(null=True, blank=True, max_length=150)
    total = models.IntegerField(default=0)
    total_urg = models.IntegerField(default=0)
    created_at = models.DateField(auto_now_add=True)
    transaction_id = models.TextField(null=True, blank=True)
    count = models.IntegerField(default=0)
    expired_date = models.DateField(null=True, blank=True)
    is_freed = models.BooleanField(default=False)



class UserGame(models.Model) :
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="games", null=True, blank=True)
    value1 = models.CharField(max_length=150, null=True, blank=True)
    value2 = models.CharField(max_length=150, null=True, blank=True)
    day = models.DateField(auto_now_add=True)
    def __str__(self) -> str:
        return f"{self.day} - {self.user}"

def replace(key, targ, allstring):
    return allstring.replace(key, targ)

def create_cats(ls ) :
    old = Label.objects.all()
    old.delete()
    for l in ls :
        name = list(l.keys())[0]
        label = Label.objects.create(name = name)
        print('Done --> ', name)
        for c in l[name] :
            name = list(c.keys())[0]
            cat = Category.objects.create(name = name)
            label.cats.add(cat)
            print('Done --> ', name)
            for s in c[name] :
                names = s.split(':')
                sub = SubCategory.objects.create(name = names[0], box = cat)
                if len(names) == 2 :
                    sub.default_price = int(names[1])
                sub.save()
                print('Done --> ', s)
    print('All Done !')


def extract_cats() :
    print('Opening Zawadi Categories file ...')
    f = open('categorie_zawadi')
    print('Opened !')
    l = f.readlines()
    l = [
        replace("\n", "", p) for p in l
    ]
    ls= []
    for p in l :
        ex = {} 
        if p[0] != "\t" :
            ex[p] = []
            ls.append(ex)
        elif p[0] == "\t" and p[1] != "\t" :
            n = ls[-1]
            #n[list(n.keys())[0]].append(replace("\t", "", p))
            ex = {}
            ex[replace("\t", "", p)] = []
            n[list(n.keys())[0]].append(ex)
        else :
            n = ls[-1]
            label = n[list(n.keys())[0]]
            my = label[-1]
            myl = my[list(my.keys())[0]].append(replace("\t\t", "", p))
    create_cats(ls)
    print('Closing Zawadi Categories file ...')
    f.close()
    print('Closed !!')

def get_lis(name) :
    return name.split(":")

def install_all_cats(is_real = False) :
    if is_real : 
        print("Deleting all cats ",Category.objects.all().delete())
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
    for line in lines :
        if "\t\t\t" in line :
            name = line[3:]
            subsub = SubCategory.objects.create(name = get_lis(name)[0], sub_box= SubCategory.objects.get(pk = cur_sub))
            if len(get_lis(name)) > 1 :
                subsub.default_price = int(get_lis(name)[1])
                subsub.save()
            print(f'\t\t\tDone SubSub --> {subsub.name}')
        elif "\t\t" in line :
            name = line[2:]
            sub = SubCategory.objects.create(name = get_lis(name)[0], box = Category.objects.get(pk = cur_cat))
            if len(get_lis(name)) > 1 :
                sub.default_price = int(get_lis(name)[1])
                sub.save()
            cur_sub = sub.pk
            print(f'\t\tDone Sub --> {sub.name}')
        elif "\t" in line :
            name = line[1:]
            cat = Category.objects.create(name = name, label = Label.objects.get(pk = cur_label))
            cur_cat = cat.pk
            print(f'\tDone Cat --> {cat.name}')
        else :
            name = line
            label = Label.objects.create(name = name)
            cur_label = label.pk
            print(f'Done Label --> {label.name}')
    f.close()
    print('Files closed')
    
    