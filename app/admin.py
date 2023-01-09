from django.contrib import admin
from django.apps import apps
from .models import SellerAccount

models = apps.get_models()

for model in models :
    if model != SellerAccount :
        if str(model) != "<class 'fcm_django.models.FCMDevice'>" :
            try :
                admin.site.register(model) 
            except :
                pass


@admin.action(description='Send test notificatiion')
def send_test_notif(modeladmin, request, queryset) :
    for obj in queryset :
        obj.send_test_notif()

class SellerAdmin(admin.ModelAdmin) :
    list_display = ['name', 'rest', 'damount']
    actions = [send_test_notif]

admin.site.register(SellerAccount, SellerAdmin)