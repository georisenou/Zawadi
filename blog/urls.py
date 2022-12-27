from django.urls import path
from .views import *


urlpatterns = [
    path('', index, name="blog_index" ),
    path('testimonies/', testimonies, name="testimonies"),
    path('blog/<str:slug>/', blog, name="blog"),
    path('subject/<str:slug>/', get_subject, name="get_subject"),
    path('ssubject/<str:slug>/', get_ssubject, name="get_ssubject")
]