
from django.urls import path
from blog import views as blog_views
from .views import achat_manifest, achat_offline, achat_serviceworker, charg_parrain, coming_soon, customers, delete_demand, get_all_cats, get_demands, landing_page, logout_view, offline, p_home, parrain_view, register_demand, register_parrain, set_num_vend
from django.conf.urls.static import static
from django.conf import settings

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
    path('api/set_num_vend/', set_num_vend, name="set_num_vend"),
    path('logout/', logout_view, name="logout"),
    path('blog/', blog_views.index, name="blog_v"),
    path('testimonies/', blog_views.testimonies, name="testimonies"),
    path('blog/<str:slug>/', blog_views.blog, name="blog"),
    path('blog/subject/<str:slug>/', blog_views.get_subject, name="get_subject"),
    path('blog/ssubject/<str:slug>/', blog_views.get_ssubject, name="get_ssubject"),
    path('api/blog/set_thing/', blog_views.set_things, name="set_things"),
    path('landing/', landing_page, name="landing_page"),
    path('parrain/', charg_parrain, name="charg_parrain"),
    path('p/<str:ident>/', p_home, name="p_home" ),
    path('parrain/<str:ident>/', parrain_view, name="parrain"),
    path('register_parrain/', register_parrain, name="register_parrain"),
    
]+static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT )