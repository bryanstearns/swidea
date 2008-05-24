from django.conf.urls.defaults import *

urlpatterns = patterns('',
    # Example:
    # (r'^swidea/', include('swidea.foo.urls')),

    # Uncomment this for admin:
     (r'^admin/', include('django.contrib.admin.urls')),
)
