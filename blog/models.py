from django.db import models
from app.models import *

# Create your models here.

class Subject(models.Model) :
    name = models.CharField(max_length=150, null= True, blank=True)
    created_at = models.DateTimeField(auto_now=True)
    def __str__(self) -> str:
        return self.name
    def get_slug(self) :
        return f"{self.name}:{self.pk}"

class SubSubjects(models.Model) : 
    name = models.CharField(max_length=150, null= True, blank=True)
    box = models.ForeignKey(Subject, related_name="subs", on_delete=models.CASCADE, null=True, blank=True)
    created_at = models.DateTimeField(auto_now=True)
    def __str__(self) -> str:
        return self.name
    def get_slug(self) :
        return f"{self.name}:{self.pk}"

class VideoArt(models.Model) :
    file = models.ForeignKey(MyFiles, null=True, blank=True, related_name="vids", on_delete=models.CASCADE)
    

class Articles( models.Model) :
    main_img = models.ForeignKey(MyFiles, on_delete=models.CASCADE, null=True, blank=True, related_name="articles_vid")
    title = models.CharField(null=True, blank=True, max_length=150)
    subtitle = models.TextField(default="Expliqué en 1 min")
    vues = models.IntegerField(default=158, blank=True)
    rvues = models.IntegerField(default=0, blank=True)
    html = models.TextField(null=True, blank=True)
    video = models.OneToOneField(VideoArt, null=True, blank=True, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    subs = models.ManyToManyField(SubCategory, related_name="articles", null=True, blank=True)
    ssubject = models.ManyToManyField(SubSubjects, null=True, blank=True, related_name="articles")
    subject= models.ManyToManyField(Subject, null=True, blank=True, related_name="articles")
    slug = models.TextField(null=True, blank=True)
    dem = models.CharField(max_length=180, null=True, blank=True)
    dem_pk = models.IntegerField(null=True, blank=True)
    whatsapp_title = models.CharField(max_length=65, null=True, blank=True)
    def __str__(self) -> str:
        return self.slug
    def get_comments(self) :
        return self.comments.all().filter(is_published = True)
    def get_main_img(self) :
        return self.main_img.file.url 
    def market_display( self) :
        url_list = self.get_main_img().split("/upload/")
        url = "/upload/q_auto:eco/".join(url_list)
        
        return url 
    def get_dem(self) :
        return self.dem
    def get_dem_pk(self) :
        return self.dem_pk
    def get_slug(self) :
        return f"{self.slug}:{self.pk}"
    def get_video( self) :
        return self.video.file.file.url if self.video else False
    def get_com_count(self) :
        return self.get_comments().count()

class Comment(models.Model) :
    article = models.ForeignKey(Articles, on_delete=models.CASCADE ,related_name="comments", null=True, blank=True)
    user = models.ForeignKey(User, null=True, blank=True, related_name="comments", on_delete=models.CASCADE)
    text = models.TextField(null=True, blank=True)
    for_zawadi = models.BooleanField(default=False)
    point = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    is_published = models.BooleanField(default=False)
    def get_name(self) :
        return f"{self.user.first_name} {self.user.last_name}"
    def get_typ(self) :
        client = Client.objects.filter(user = self.user)
        return 'acheteur de Zawadi' if client.exists() else 'vendeur de zawadi'
    def get_duration(self):
        duration = (timezone.now() - self.created_at)
        seconds = duration.total_seconds()
        if seconds < 60:
            return "0 min"
        elif seconds < 3600:
            return  str(int(seconds / 60)) + " min"
        elif seconds < 24 * 3600:
            return  str(int(seconds / 3600)) + " h"
        else:
            return  'il y quelques heures'

