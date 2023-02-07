from django import template
from app.models import ClientDemand, SellerAccount
# Create your views here.

register = template.Library()

@register.simple_tag
def a_ete_notifie(dem, seller) :
    return "Oui" if dem.a_ete_notifie(seller) else "Non"