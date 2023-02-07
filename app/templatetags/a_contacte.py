from django import template
from app.models import ClientDemand, SellerAccount
# Create your views here.

register = template.Library()

@register.simple_tag
def a_contacte(dem, seller) :
    return "Oui" if dem.a_contacte(seller) else "Non"
