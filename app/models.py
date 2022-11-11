
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils import timezone
from .managers import CustomUserManager

MONTHS = ['Jan', 'Fev', 'Mars', 'Avr', 'Mai', 'Juin', 'Juil', 'Août', 'Sept' ,'Oct', 'Nov', 'Dec']

# Create your models here.

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
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    objects = CustomUserManager()
    country = models.CharField(max_length=15, null=True, blank=True)
    towns = models.CharField(max_length=250, null=True, blank=True)

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
    def __str__(self) -> str:
        return self.name

class ClientDemand(models.Model) :
    client = models.ForeignKey(Client, null=True, blank=True, on_delete=models.CASCADE, related_name="demandes")
    created_at = models.DateTimeField(auto_now_add=True)
    date = models.DateField(auto_now_add= True, null=True)
    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.CASCADE, related_name="demandes")
    subs = models.ForeignKey(SubCategory, null=True, blank=True, on_delete=models.CASCADE, related_name="demandes")
    emergency = models.CharField(max_length=250, null=True, blank=True)
    point = models.IntegerField(default=0)
    is_out = models.BooleanField(default=False)
    def get_duration(self):
        duration = (timezone.now() - self.created_at)
        seconds = duration.total_seconds()
        if seconds < 60:
            return "a l'instant"
        elif seconds < 3600:
            return 'il y a ' + str(int(seconds / 60)) + " min"
        elif seconds < 24 * 3600:
            return 'il y a ' + str(int(seconds / 3600)) + " h"
        else:
            return 'il y a ' + str(int(seconds / (24*3600))) + " j"
    def __str__(self) -> str:
        return f'Client{self.pk}'

class SellerAccount(models.Model) :
    user = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name="accounts")
    name = models.CharField(max_length=250, null=True, blank=True)
    rest = models.IntegerField(default=0)
    abn_count = models.IntegerField(default=0)
    last_abn = models.DateTimeField(null=True, blank=True)
    created_at = models.DateField(auto_now_add= True, null=True, blank=True)
    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.CASCADE)
    subs = models.ManyToManyField(SubCategory, related_name="sellers", blank=True)
    count = models.BigIntegerField(default=0)
    picture = models.FileField(upload_to='accounts/', null=True, blank=True)
    type_of = models.CharField(max_length=150, null=True, blank=True)
    speed = models.IntegerField(default=0)
    expired_date = models.DateField(null=True, blank=True)
    def get_week(self) :
        return self.weeks.all().filter(is_on= True).first()
    def __str__(self) -> str:
        return self.name
    def get_picture(self) :
        return self.picture.url if self.picture else ZawadiDetail.objects.get(key = 'default:shop:picture:url').value
    


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


class Feedback(models.Model) :
    user = models.CharField(max_length=250, null=True, blank=True)
    seller = models.CharField(max_length=250, null=True, blank=True)
    picture = models.FileField(null=True, blank=True, upload_to='feedback/')
    text = models.TextField(max_length=250, null=True, blank=True)
    rank = models.IntegerField(default=1)
    def __str__(self) -> str:
        return self.seller
    def get_picture(self) :
        return self.picture.all() if self.picture else ZawadiDetail.objects.get(key = 'default:shop:picture:url').value

class AbnFeature(models.Model) :
    seller = models.ForeignKey(SellerAccount, null=True, blank=True, on_delete=models.CASCADE, related_name="abns")
    type_of = models.CharField(null=True, blank=True, max_length=150)
    total = models.IntegerField(default=0)
    total_urg = models.IntegerField(default=0)
    created_at = models.DateField(auto_now_add=True)
    transaction_id = models.TextField(null=True, blank=True)
    count = models.IntegerField(default=0)
    expired_date = models.DateField(null=True, blank=True)

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
                sub = SubCategory.objects.create(name = s, box = cat)
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

