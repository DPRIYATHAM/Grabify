from django.urls import path
from api import views

urlpatterns = [
    path('items/', views.ItemList.as_view()),
    path('items/veg/', views.VegItemList.as_view()),
    path('items/nonveg/', views.NonVegItemList.as_view()),
    path('items/asc/', views.ItemListAsc.as_view()),
    path('items/desc/', views.ItemListDesc.as_view()),
]