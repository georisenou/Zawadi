from rest_framework import serializers
from app.models import Category, Label, MyFiles, SubCategory
from .models import ClientPayment, Demand, Discussion, MoMoCompte, Patner, PatnerPay, PatnerSub, PatnerTemplate, Products, SellerPay, SellerState, SubProduct, Client

class MyFileSerializer(serializers.ModelSerializer) :
    class Meta :
        model = MyFiles
        fields = ('id', 'name', 'get_file')

class ProductSerializer(serializers.ModelSerializer) :
    files = MyFileSerializer(many = True)
    class Meta :
        model = Products
        fields = ('id', 'name', 'min_p', 'max_p', 'is_sold', 'details', 'sold_date', 'files', 'get_seller')

class ClientSerializer(serializers.ModelSerializer) :
    class Meta :
        model = Client
        fields = ('id', 'get_complete_name', 'get_email', 'get_whatsapp', 'get_email', 'get_phone')

class DemandSerializer(serializers.ModelSerializer) :
    client = ClientSerializer()
    class Meta :
        model = Demand
        fields = ('id', 'get_subs', 'bdg', 'currency', 'num', 'get_duration', 'state', 'get_color', 'payment', 'satisfied', 'can_pay', 'rep_picture', 'client', 'get_quart', 'unique_id', "is_remb")

class SSubSerializer(serializers.ModelSerializer) :
    class Meta :
        model = SubCategory
        fields = ('id', 'name', 'get_picture')

class SubSerializer(serializers.ModelSerializer) :
    subs = SSubSerializer(many = True)
    class Meta :
        model = SubCategory
        fields = ('id', 'name', 'get_picture', 'subs' )

class CatSerializer(serializers.ModelSerializer) :
    subs = SubSerializer(many = True)
    class Meta :
        model = Category
        fields = ('id', 'name', 'get_picture', 'subs')

class LabelSerializer(serializers.ModelSerializer) :
    cats = CatSerializer(many = True )
    class Meta :
        model = Label
        fields = ('id', 'name', 'get_picture', 'cats' )

class ClientPaySerializer(serializers.ModelSerializer) :
    class Meta :
        model = ClientPayment
        fields = ('id', 'montant', 'created_at', 'transaction_id', 'statut', 'get_color')

class MoMOSerializer(serializers.ModelSerializer) :
    class Meta :
        model = MoMoCompte
        fields = ('id', 'get_name', 'number', 'get_piece')

class SellerPaySerializer(serializers.ModelSerializer) :
    class Meta :
        model = SellerPay
        fields = ('id', 'montant', 'currency', 'type_of', 'get_tcolor', 'transaction_id', 'statut', 'get_color', 'created_at')

class SubProductSerializer(serializers.ModelSerializer) :
    seller_s = serializers.CharField(source="seller_s.seller.name")
    class Meta :
        model = SubProduct
        fields = ('id', 'seller_s', 'get_cat', 'get_subs', 'p_count', 's_count', 'get_picture', 'livraison', 'get_min_max', 'get_spicture')

class SellerStateSerializer(serializers.ModelSerializer) :
    seller = serializers.CharField(source="seller.name")
    subs = SubProductSerializer(many = True)
    class Meta:
        model = SellerState
        fields = ('id', 'seller', 'solde', 'total_solde', 'subs', 'get_picture', 'p_count')

class PatnerSubSerializer(serializers.ModelSerializer) :
    class Meta :
        model = PatnerSub
        fields = ('id', 'get_subs', 'get_cat', 'get_picture', 's_count')

class PatnerSerializer(serializers.ModelSerializer) :
    mysubs = PatnerSubSerializer(many = True)
    class Meta :
        model = Patner
        fields = ('id', 'get_user', 'is_on','solde', 'total_solde', 'p_count', 'has_new_dem', 'mysubs', 'get_picture', 'new_dem')

class PatnerPaySerializer(serializers.ModelSerializer) :
    class Meta :
        model = PatnerPay
        fields = ('id', 'montant', 'currency', 'type_of', 'get_tcolor', 'transaction_id', 'statut', 'get_color', 'created_at')

class SubProductDetailSerializer(serializers.ModelSerializer) :
    
    class Meta :
        model = SubProduct
        fields = ('id', 'get_sname', 'get_spicture', 'get_swhatsapp', 'livraison', 'get_min_max', 'p_count', 'get_spk')

class PatnerTemplateSerializer(serializers.ModelSerializer) :
    sub_p = SubProductDetailSerializer()
    class Meta :
        model = PatnerTemplate
        fields = ('id', 'sub_p', 'price')

class DiscussionSerializer(serializers.ModelSerializer) :
    demand = DemandSerializer()
    payment = ClientPaySerializer()
    class Meta :
        model = Discussion
        fields = ('id', 'rpatner', 'demand', 'statut', 'has_pay', 'has_validate', 'payment', 'not_yet')
