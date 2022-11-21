
from django.urls import path
from .views import achat_manifest, achat_offline, achat_serviceworker, coming_soon, customers, delete_demand, get_all_cats, get_demands, offline, register_demand, set_num_vend

urlpatterns = [
    path('', customers, name="customers_index"),
    path('manifest.json/', achat_manifest, name="achat_manifest"),
    path('offline/', achat_offline, name="offline"),
    path('serviceworker.js', achat_serviceworker, name="achat_serviceworker"),
    path('api/demand/', register_demand, name="register_demand"),
    path('api/get_demands/', get_demands, name="get_demands"),
    path('api/delete_demand/<int:pk>/', delete_demand, name="delete_demand"),
    path('beta/', coming_soon, name="coming_soon"),
    path('api/get_all_cats/', get_all_cats, name = "get_all_cats"),
    path('api/set_num_vend/', set_num_vend, name="set_num_vend")
]