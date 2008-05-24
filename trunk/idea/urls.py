from django.conf.urls.defaults import *
import welcome

urlpatterns = patterns('',
    (r'^$', welcome.index),
)
