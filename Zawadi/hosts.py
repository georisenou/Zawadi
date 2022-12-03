from unicodedata import name
from django_hosts import patterns, host

host_patterns = patterns('', 
    host(r'vendeur', 'Zawadi.urls', name="seller"),
    host(r'zawadi', 'Zawadi.urls', name="seller"),
    host(r'', 'app.urls_client', name="achat")
)