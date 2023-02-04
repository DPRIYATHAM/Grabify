from rest_framework import serializers
from .models import item

class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = item
        fields = ['item_id', 'item_name', 'image_link', 'item_price', 'item_desc']