from django.urls import path
from api import views

urlpatterns = [
    path('items/', views.ItemList.as_view()),
]