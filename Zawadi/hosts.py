from unicodedata import name
from django_hosts import patterns, host

host_patterns = patterns('', 
    host(r'vendeur', 'Zawadi.urls', name="seller"),
    host(r'zawa', 'Zawadi.urls', name="test_seller"),
    host(r'zawadi', 'app.urls_client', name="api-test"),
    host(r'api', 'app.urls_client', name="api"),
    host(r'v1', 'app.urls_client', name="achat"),
    host(r'', 'app.urls_client', name="backup"),
    host(r'blog', 'blog.urls', name="blog")
)
