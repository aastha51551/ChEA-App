
from django.urls import path
from .views import get_opportunities


urlpatterns = [
    path('opportunities/', get_opportunities),
]