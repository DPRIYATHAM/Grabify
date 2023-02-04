from .models import item
from .serializers import ItemSerializer
from rest_framework.generics import ListAPIView

# Create your views here.

class ItemList(ListAPIView):
    queryset = item.objects.all()
    serializer_class = ItemSerializer

class VegItemList(ListAPIView):
    queryset = item.objects.filter(item_desc='Veg')
    serializer_class = ItemSerializer

class NonVegItemList(ListAPIView):
    queryset = item.objects.filter(item_desc='Non Veg')
    serializer_class = ItemSerializer

#order items in ascending order
class ItemListAsc(ListAPIView):
    queryset = item.objects.all().order_by('item_price')
    serializer_class = ItemSerializer

#order items in descending order
class ItemListDesc(ListAPIView):
    queryset = item.objects.all().order_by('-item_price')
    serializer_class = ItemSerializer