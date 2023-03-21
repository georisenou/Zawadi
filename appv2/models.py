import json
from django.db import models
from django.utils import timezone
from haversine import haversine, Unit
from django.db.models import Count
from app.models import API_URL, AdminToken, Category, Label, MyFiles, SellerAccount, SubCategory, User, Client, ZawadiDetail, get_payment_template, get_value, ident_generator, send_messages
from django.db.models.signals import post_save
from django.dispatch import receiver

PRICE_PER = 80

class Demand(models.Model) :
    client = models.ForeignKey(Client, null=True, blank=True, related_name="mew_demands", on_delete=models.CASCADE)
    subs = models.ForeignKey(SubCategory, null=True, blank=True, related_name="new_demands", on_delete=models.CASCADE)
    ssubs = models.ManyToManyField(SubCategory, blank=True)
    bdg = models.IntegerField( null=True, blank=True)
    currency = models.CharField(max_length=10, null=True, blank=True, default="XOF")
    num = models.IntegerField(null=True, blank=True, default=1)
    available_for = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    state = models.CharField(default="En attente", max_length=150)
    payment = models.BigIntegerField(default = 0)
    satisfied = models.BooleanField(default=False)
    unique_id = models.CharField(max_length=50, null=True, blank=True)
    def is_remb(self) :
        pay =  self.payments.all().order_by('-created_at').first()
        if pay :
            return pay.statut() == "En cours de remboursement"
        return False
    def can_dem_new(self) :
        dis = self.discussions.filter(statut = 'En cours')
        if dis.exists() and ( not self.payment) :
            return True
        else :
            return False
    def set_default_id(self) :
        if not self.unique_id :
            self.unique_id = ident_generator(5, 9)
            self.save()
    def get_quart(self) :
        return json.loads(self.client.user.quart)
    def rep_picture(self) :
        return self.subs.get_picture()
    def get_main_dis(self) :
        dis = self.discussions.order_by('-created_at').first().pk if self.discussions.count() else 0 
        return dis
    def get_color(self) :
        if self.state == 'En attente' :
            return 'gray'
        elif self.state == 'En discussion' :
            return 'yellow'
        elif self.state == 'En attente de satisfaction' :
            return 'orange'
        elif self.state == 'Satisfaite' :
            return 'green'
    def get_ssubs(self) :
        count = self.ssubs.count()
        txt = ""
        for i in range(0, count) :
            txt += self.ssubs.all()[i].name
            if (count - (i+1)) > 1 :
                txt += ", "
            elif (count - (i+1)) == 1 :
                txt += " et "
        return txt
    def get_subs(self) :
        self.set_default_id()
        return f"Demande de {self.subs.get_name()}"
    def get_duration(self):
        duration = (timezone.now() - self.created_at)
        seconds = duration.total_seconds()
        if seconds < 60:
            return f"{int(seconds)}s"
        elif seconds < 3600:
            return str(int(seconds / 60)) + " min"
        elif seconds < 24 * 3600:
            return str(int(seconds / 3600)) + " h"
        else:
            return str(int(seconds / (24*3600))) + " j"
    def can_pay(self) :
        tok = AdminToken.objects.filter(name = f'dem:{self.pk}-dis:{self.get_main_dis()}')
        if tok.exists() :
            return tok.first().token
        else :
            return 0

class ClientPayment(models.Model) :
    client = models.ForeignKey(Client, null=True, blank=True, related_name="paiements", on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    demand = models.ForeignKey(Demand, null=True, blank=True, related_name="payments", on_delete=models.CASCADE)
    transaction_id = models.CharField(max_length=150, null=True, blank=True)
    def montant(self) :
        return self.demand.payment
    def statut(self) :
        rembs = self.remboursements.all()
        if rembs.filter(done = True).count() :
            return "Remboursé"
        elif rembs.count() :
            return "En cours de remboursement"
        else :
            return "Payé"
    def get_color(self) :
        state = self.statut() 
        if state == "Remboursé" :
            return 'red'
        elif state == "En cours de remboursement" :
            return 'gray'
        elif state == "Payé" :
            return 'green'


class Patner(models.Model) :
    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    is_on = models.BooleanField(default=False)
    solde = models.BigIntegerField(default=0)
    total_solde = models.BigIntegerField(default=0)
    momos = models.ManyToManyField("MoMoCompte", related_name="patners", blank=True)
    current_momo = models.BigIntegerField(default=0)
    whatsapp = models.CharField(max_length=150, null=True, blank=True)
    picture = models.OneToOneField(MyFiles, null=True, blank=True, on_delete=models.PROTECT)
    def has_retr(self) :
        return True if self.payments.filter(statut = "En cours").count() else False
    def get_picture(self) :
        return self.picture.file.url if self.picture else ZawadiDetail.objects.get(key = "default:patner:picture").value
    def get_quart(self) :
        return json.loads(self.user.quart)
    def p_count(self) -> int :
        mydis = Discussion.objects.filter(rpatner = self.pk, statut = "Finalisé")
        count = 0
        for d in mydis :
            count += d.sold.count()
        return count
    def get_user(self) :
        return f"{self.user.first_name} {self.user.last_name}"
    def get_latlng(self):
        print(self.user.quart)
        quart = json.loads(self.user.quart)
        return quart
    def get_distance(self, quart) :
        me = self.get_latlng()['lat'], self.get_latlng()['lng']
        dem = quart['lat'], quart['lng']
        return haversine(me, dem)
    def has_new_dem(self) :
        dis_count = Discussion.objects.filter(rpatner = self.pk, statut = "En attente" ).count()
        return True if dis_count else False
    def new_dem(self) :
        dis_count = Discussion.objects.filter(rpatner = self.pk, statut = "En attente" ).count()
        return dis_count

class Products(models.Model) :
    seller = models.ForeignKey(SellerAccount, null=True, blank=True, related_name="products", on_delete=models.CASCADE)
    files = models.ManyToManyField(MyFiles, null=True, blank=True, related_name="products")
    min_p = models.BigIntegerField(blank=True)
    max_p = models.BigIntegerField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    subs = models.ForeignKey(SubCategory, null=True, blank=True, related_name="products", on_delete=models.CASCADE)
    is_sold = models.BooleanField(default=False)
    name = models.CharField(max_length=150, null=True, blank=True)
    details = models.TextField(null=True, blank=True)
    sold_date = models.DateTimeField(null=True, blank=True)
    def get_seller(self) :
        seller_s = SellerState.objects.get(seller = self.seller)
        return f'seller:{seller_s.pk}'

class PatnerTemplate(models.Model) :
    sub_p = models.ForeignKey("SubProduct", null=True, blank=True, on_delete=models.CASCADE, related_name="templates")
    created_at = models.DateTimeField(auto_now_add=True)
    price = models.BigIntegerField(null=True, blank=True)
    whatsapp = models.CharField(max_length=150, null=True, blank=True)
    typ = models.CharField(max_length=150, null=True, blank=True)
    


class PatnerSub(models.Model) :
    patner = models.ForeignKey(Patner, null=True, blank= True, related_name="mysubs", on_delete=models.CASCADE)
    subs = models.ForeignKey(SubCategory, null=True, blank=True, related_name="patners", on_delete=models.CASCADE)
    templates = models.ManyToManyField(PatnerTemplate, blank=True, related_name="in_subs")
    def get_cat(self) :
        return self.subs.get_cat().name
    def get_subs(self) :
        return self.subs.name
    def get_picture(self) :
        return self.subs.get_picture()
    def s_count(self) -> int :
        mydis = Discussion.objects.filter(rpatner = self.pk, statut = "Finalisé")
        count = 0
        for d in mydis :
            count += d.sold.filter(subs__pk = self.subs.pk).count()
        return count

class Discussion(models.Model) :
    rpatner = models.IntegerField(default=0)
    patner = models.ManyToManyField(Patner, blank=True, related_name="discussions")
    demand = models.ForeignKey(Demand, null=True, blank=True, related_name="discussions", on_delete=models.CASCADE)
    statut = models.CharField(max_length=150, null=True, blank=True)
    products_prop = models.ManyToManyField(Products, blank=True, related_name="is_props_for")
    sold = models.ManyToManyField(Products, blank=True, related_name="sold_in")
    created_at = models.DateTimeField(auto_now_add=True)
    amount = models.BigIntegerField(default=0)
    payment = models.OneToOneField(ClientPayment, null=True, blank=True, on_delete=models.CASCADE)
    is_deleted = models.BooleanField(default=False)
    templates = models.ManyToManyField(PatnerTemplate ,blank=True, related_name="discussions")
    payment_plan = models.TextField(null=True, blank=True)
    def get_label(self) :
        return self.demand.subs.get_cat().label
    def has_pay(self) :
        return True if self.payment else False
    def has_validate(self) :
        return self.demand.can_pay()
    def not_yet(self) :
        if self.demand.state == 'En discussion' :
            return 0 if not self.has_validate else 1
        elif self.demand.state == 'En attente' or self.demand.state == 'Satisfaite' :
            return 0
        elif self.demand.state == 'En attente de satisfaction' :
            return 2
        elif self.demand.state == 'Satisfaite' :
            return 3
    def get_amount(self) :
        val = float(get_value('debit_percentage'))
        return self.amount / (1+ val)
            

class Remboursement(models.Model) :
    demand = models.ForeignKey(Demand, on_delete=models.PROTECT, related_name="remboursements", null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    clientpay = models.ForeignKey(ClientPayment, related_name="remboursements", on_delete=models.CASCADE, null=True, blank=True)
    done = models.BooleanField(default=False)
    def __str__(self) -> str :
        return self.demand.get_subs()

class MoMoCompte(models.Model) :
    name = models.CharField(max_length=150, null=True, blank=True)
    number = models.CharField(max_length=150, null=True, blank=True)
    piece = models.OneToOneField(MyFiles, on_delete=models.CASCADE, null=True, blank=True)
    def get_piece(self) :
        return self.piece.file.url
    def get_name(self) :
        return f"Compte Momo: {self.name}"

class SellerState(models.Model) :
    seller = models.OneToOneField(SellerAccount, blank=True, related_name="state", on_delete=models.CASCADE )
    solde = models.BigIntegerField(default=0)
    total_solde = models.BigIntegerField(default=0)
    momos = models.ManyToManyField(MoMoCompte, related_name="seller_s", blank=True)
    current_momo = models.BigIntegerField(default=0)
    def get_picture(self) :
        return self.seller.get_picture()
    def p_count(self) :
        return self.seller.products.filter(is_sold = True).count()
    def t_count(self) :
        return self.seller.products.all().count()
    def has_retr(self) :
        return True if self.payments.filter(statut = "En cours").count() else False


class PatnerPay(models.Model) :
    created_at = models.DateTimeField(auto_now_add=True)
    montant = models.FloatField(blank=True)
    type_of = models.CharField(max_length=150, null=True, blank=True)
    transaction_id = models.TextField(null=True, blank=True)
    statut = models.CharField(max_length=150, blank=True, default="En cours")
    patner = models.ForeignKey(Patner, related_name="payments", on_delete=models.CASCADE, null=True, blank=True)
    currency = models.CharField(max_length=10, default="XOF")
    dis = models.ForeignKey(Discussion, related_name="patner_pays", on_delete=models.CASCADE, null=True, blank=True)
    def get_color(self) :
        return "gray" if self.statut == "En cours" else "green"
    def get_tcolor(self) :
        return "orange" if self.type_of == "Paiement" else "green"

class SellerPay(models.Model) :
    created_at = models.DateTimeField(auto_now_add=True)
    montant = models.FloatField(blank=True)
    type_of = models.CharField(max_length=150, null=True, blank=True)
    transaction_id = models.TextField(null=True, blank=True)
    statut = models.CharField(max_length=150, blank=True, default="En cours")
    seller_s = models.ForeignKey(SellerState, related_name="payments", on_delete=models.CASCADE, null=True, blank=True)
    currency = models.CharField(max_length=10, default="XOF")
    dis = models.ForeignKey(Discussion, related_name="seller_pays", on_delete=models.CASCADE, null=True, blank=True)
    def get_color(self) :
        return "gray" if self.statut == "En cours" else "green"
    def get_tcolor(self) :
        return "orange" if self.type_of == "Paiement" else "green"


class SubProduct(models.Model) :
    seller_s = models.ForeignKey(SellerState, null=True, blank=True, related_name="subs", on_delete=models.CASCADE)
    subs = models.ForeignKey(SubCategory, related_name="subs_sellers", on_delete=models.CASCADE, null=True, blank=True)
    products = models.ManyToManyField(Products,  blank=True, related_name="subs_state")
    livraison = models.TextField(null=True, blank=True)
    def get_spk(self) :
        return self.seller_s.pk
    def get_sname(self) :
        return self.seller_s.seller.name
    def get_spicture(self) :
        return self.seller_s.get_picture()
    def get_swhatsapp(self) :
        return self.seller_s.seller.format_number
    
    def p_count(self) :
        return self.products.all().count()
    def s_count(self) :
        return self.products.filter(is_sold = True).count()
    def get_subs(self) :
        return self.subs.name
    def get_cat(self) :
        return self.subs.get_cat().name
    def get_picture(self) :
        return self.subs.get_picture()
    def get_min_max(self) :
        lis= [
            {'min' : prod.min_p, 'max' : prod.max_p, 'prods' : []} for prod in self.products.all()
        ]
        final = []
        for e in lis :
            if not e in final :
                final.append(e)
        return final


def get_f_name(dis, seller_s, typ = "seller") :
    if typ == "seller" :
        prods = dis.sold.filter(seller = seller_s.seller)
        names = "( "
        lis = [
            prod.name for prod in prods 
        ]
        for name in lis :
            names += (name if not name in names else "")
        names += " )"
        return names
    elif typ == "patner" :
        print('this demmm =>', dis.demand.subs.name)
        return f"( {dis.demand.subs.name} )"

@receiver(post_save, sender=SellerPay)
def send_notif(sender, instance, created, **kwargs) :
    if created :
        montant = instance.montant
        f_name = get_f_name(instance.dis, instance.seller_s)
        number = instance.seller_s.seller.format_number
        if instance.type_of == "Paiement" :
            instance.seller_s.solde += instance.montant
            instance.seller_s.total_solde += instance.montant
            instance.seller_s.save()
            instance.statut = "Effectué"
            instance.save()
            try :
                send_messages(get_payment_template(montant, f_name, number), f'seller_pay:{instance.pk}')
            except Exception as e :
                print(e)

@receiver(post_save, sender=PatnerPay)
def psend_notif(sender, instance, created, **kwargs) :
    if created :
        montant = instance.montant
        f_name = get_f_name(instance.dis, instance.patner, "patner")
        number = instance.patner.whatsapp
        if instance.type_of == "Paiement" :
            instance.patner.solde += instance.montant
            instance.patner.total_solde += instance.montant
            instance.patner.save()
            instance.statut = "Effectué"
            instance.save()
            try :
                send_messages(get_payment_template(montant, f_name, number), f'patner_pay:{instance.pk}')
            except Exception as e :
                print(e)
