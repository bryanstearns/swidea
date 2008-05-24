from django.conf.urls.defaults import *
from django.contrib.auth.views import login, logout
import welcome, registration

urlpatterns = patterns('',
    (r'^$', welcome.index),
    (r'^registration/register/$', registration.register),
    (r'^accounts/login/$', login),
    (r'^accounts/logout/$', logout),
)
