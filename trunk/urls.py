from django.conf.urls.defaults import *

urlpatterns = patterns('',
    # Enable the admin interface
    (r'^admin/', include('django.contrib.admin.urls')),

    # Delegate everything else
    (r'', include('swidea.idea.urls')),
)
