from django.contrib import admin
from django.conf import settings
from django.urls import path

from . import views

urlpatterns = [
    path("", views.redirect_to_admin),
    path(f'{settings.URL_PREFIX.strip("/")}/', admin.site.urls),
]
