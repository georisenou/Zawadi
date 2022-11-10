from django.urls import path
from .views import achat_manifest, achat_offline, achat_serviceworker, customers, offline, register_demand

urlpatterns = [
    path('', customers, name="customers_index"),
    path('manifest.json/', achat_manifest, name="achat_manifest"),
    path('offline/', achat_offline, name="offline"),
    path('serviceworker.js', achat_serviceworker, name="achat_serviceworker"),
    path('api/demand/', register_demand, name="register_demand"),
]