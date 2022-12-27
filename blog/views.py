from operator import imod
from django.shortcuts import render
from app.models import Client, ClientDemand, SubCategory, User, ident_generator
from app.views import increment_value, valid_p, Paginator
from blog.models import Articles, Comment, SubSubjects, Subject
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.contrib.auth import login, authenticate, logout
# Create your views here.

def get_menu() :
    return Subject.objects.all()

def get_queryset_from_paginator(arts, number, p) :
    paginator = Paginator(arts, number)
    total = paginator.num_pages
    if total < int(p):
        return [], not(total < int(p +1))
    else :
        page = paginator.page(p)
        return page.object_list, not(total < int(p +1))


def index(request) :
    has_user = False
    increment_value('blog_visits')
    p = valid_p(request.GET.get('p'))
    arts = Articles.objects.all().order_by('-created_at')
    arts, can_con = get_queryset_from_paginator(arts=arts, number=8, p=p)
    comments = Comment.objects.filter(for_zawadi = True).filter(is_published = True).order_by('-point')[:10]
    if request.user.is_authenticated : has_user = True
    return render(request, 'blog/index.html', {
        'arts' : arts,
        'comments' : comments,
        'root' : 'home',
        'p' : p,
        'can_con' : can_con,
        'has_user' : has_user,
        'menu' : get_menu(),
    })

def testimonies(request) :
    increment_value('blog_visits')
    p = valid_p(request.GET.get('p'))
    comments = Comment.objects.filter(for_zawadi = True)
    comments, can_con = get_queryset_from_paginator(comments, number=10, p= p )
    return render(request, 'blog/testimonies.html', {
        'comments' : comments,
        'has_user' : request.user.is_authenticated,
        'menu' : get_menu(),
        'can_con' : can_con
    })

def blog(request, slug) :
    increment_value('blog_visits')
    print('auth  => ', request.user.is_authenticated)
    pk = int(slug.split(':')[1])
    article = Articles.objects.get(pk = pk)
    article.rvues += 1
    article.save()
    comments = Comment.objects.filter(for_zawadi = True).filter(is_published = True).order_by('-point')[:10]
    return render(request, 'blog/blog.html', {
        'article' : article,
        'comments' : comments,
        'has_user' : request.user.is_authenticated,
        'menu' : get_menu(),
    })

def get_subject(request, slug ) :
    increment_value('blog_visits')
    pk = int(slug.split(':')[1])
    p = valid_p(request.GET.get('p'))
    name = Subject.objects.get(pk = pk).name
    arts = Subject.objects.get(pk = pk).articles.all().order_by('-created_at')
    arts, can_con = get_queryset_from_paginator(arts=arts, number=8, p=p)
    comments = Comment.objects.filter(for_zawadi = True).filter(is_published = True).order_by('-point')[:10]
    return render(request, 'blog/index.html', {
        'arts' : arts,
        'comments' : comments,
        'root' : 'subject',
        'can_con' : can_con,
        'p' : p,
        'has_user' : request.user.is_authenticated,
        'menu' : get_menu(),
        'name' : name
    })

def get_ssubject(request, slug) :
    increment_value('blog_visits')
    pk = int(slug.split(':')[1])
    p = valid_p(request.GET.get('p'))
    name = SubSubjects.objects.get(pk = pk).name
    arts = SubSubjects.objects.get(pk = pk).articles.all().order_by('-created_at')
    arts, can_con = get_queryset_from_paginator(arts=arts, number=8, p=p)
    comments = Comment.objects.filter(for_zawadi = True).filter(is_published = True).order_by('-point')[:10]
    return render(request, 'blog/index.html', {
        'arts' : arts,
        'comments' : comments,
        'root' : 'ssubject',
        'name' : name,
        'can_con' : can_con,
        'p' : p,
        'has_user' : request.user.is_authenticated,
        'menu' : get_menu(),
    })

@api_view(['POST'])
def set_things(request) :
    if not request.user.is_authenticated:
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        country = request.POST.get('country')
        number = request.POST.get('number')
        whatsapp = request.POST.get('whatsapp')
        quart = request.POST.get('quart')
        if  User.objects.filter(email = email).exists():
            user = User.objects.get(email = email)
            user.quart = quart
            user.save()
        else:
            if  User.objects.filter(email = first_name + email).exists():
                user = User.objects.get(email = first_name + email)
            elif User.objects.filter(email = last_name + first_name + email).exists() :
                user = User.objects.get(email = last_name + first_name + email)
            else :
                user = User.objects.create_user(email=email, password=first_name + last_name + number, first_name=first_name,
                                            last_name=last_name, country=country, quart = quart)
        login(request, user = user)
        client = Client.objects.get_or_create(
            user=user, phone=number, whatsapp=whatsapp)[0]
    else:
        clients = Client.objects.get_or_create(user=request.user)
        client = clients[0]
        if clients[1]:
            number = request.POST.get('number')
            whatsapp = request.POST.get('whatsapp')
            client.phone = number
            client.whatsapp = whatsapp
            client.save()
    sub = int(request.POST.get('sub'))
    message = request.POST.get('message')
    comment = request.POST.get('comment')
    activity = request.POST.get('activity')
    emer = request.POST.get('emer')
    article = int(request.POST.get('article'))
    print(article, 'is great')
    if int(sub) :
        unique_slug = f"client:{client.pk}__{ident_generator(100, 250)}"
        sub  = SubCategory.objects.get(pk = int(sub))
        dem = ClientDemand.objects.create(client = client, category = sub.box, subs = sub, emergency = emer, quart = client.user.quart, slug = unique_slug)
    if activity != 'norm' :
        if activity == 'comment' :
            Comment.objects.create(article = Articles.objects.get(pk = int(article)), user = client.user, text = comment)
        else :
            Comment.objects.create(user = client.user, text = message, for_zawadi = True)
    return Response({
        'done' : True, 
        'result' : 'sub' if sub else 'com'
    })
