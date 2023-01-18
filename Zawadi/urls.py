"""Zawadi URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from app.views import activ_abn, activate, backup, change_pass, charg_account, clients, coming_soon, compte, compute_dprice, create_devices, customers, daily_task, for_sellers, fq_webhook, get_all_cats, index, landing_page, login_view, logout_view, new_activate, offline, register_demand, register_demands_clicked, register_view, unique_clients, vendeur_manifest, vendeur_serviceworker, very_new_activate

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
    path('clients/<int:pk>/', clients, name="clients"),
    path('login/', login_view, name="login"),
    path('register/', register_view, name="register"),
    path('old_activate/', activate, name='activate'),
    path('compte/', compte, name="compte"),
    path('customers/', customers, name="customers"),
    path('api/activ_abn/', charg_account, name="activ_abn"),
    path('activate_old/', new_activate, name="new_activate"),
    path('devices/', create_devices, name="create_devices"),
    path('api/demand/', register_demand, name="register_demand"),
    path('activate/', very_new_activate, name="activate2"),
    path('logout/', logout_view, name="logout"),
    path('api/get_all_cats/', get_all_cats, name = "get_all_cats"),
    path('manifest.json/', vendeur_manifest, name="vendeur_manifest" ),
    path('daily_task/', daily_task, name="daily_task"),
    path('offline/', offline, name="offline"),
    path('serviceworker.js', vendeur_serviceworker, name="vendeur_serviceworker"),
    path('beta/', coming_soon, name="coming_soon"),
    path('for_sellers/', for_sellers, name="for_sellers"),
    path('testback/', backup, name="backup"),
    path('mot_de_passe/<str:token>/', change_pass, name = "change_pass"),
    path('register_demands_clicked/<int:dem>/<int:seller>/', register_demands_clicked, name="register_demands_clicked"),
    path('u_clients/<str:token>/', unique_clients, name="unique_clients"),
    path('compute_dprice/', compute_dprice, name="compute_dprice"),
    path('landing/', landing_page, name="landing_page"),
    path('fq_webhook/', fq_webhook , name="fb_webhook"),
]+static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT )
