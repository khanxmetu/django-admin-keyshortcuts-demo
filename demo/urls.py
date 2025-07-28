from django.contrib import admin
from django.urls import include
from django.urls import path
from django.views.debug import default_urlconf

from . import views

urlpatterns = [
    path("django-admin-keyshortcuts-demo/", admin.site.urls),
    path("", views.redirect_to_admin),
]
