from django.contrib import admin
from .models import item
# Register your models here.
@admin.register(item)
class ItemAdmin(admin.ModelAdmin):
    list_display = ['item_id', 'item_name', 'image_link', 'item_price', 'item_desc','item_count']