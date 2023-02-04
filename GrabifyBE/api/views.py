from .models import item
from .serializers import ItemSerializer
from rest_framework.generics import ListAPIView

# Create your views here.

class ItemList(ListAPIView):
    queryset = item.objects.all()
    serializer_class = ItemSerializer