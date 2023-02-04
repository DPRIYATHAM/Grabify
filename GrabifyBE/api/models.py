from django.db import models

# Create your models here.

#Model Item
class item(models.Model):
    item_id = models.IntegerField(primary_key=True)
    item_name = models.CharField(max_length=1000)
    image_link = models.CharField(max_length=1000)
    item_price = models.CharField(max_length=1000)
    item_desc = models.CharField(max_length=1000)

#Manually create a table in the database
#python manage.py shell
#from api.models import item
#item.objects.all() #will give all objects in the table
#item.objects.create(item_id=21, item_name='test_name', image_link='test_link', item_price='test_price', item_desc='test_desc')
#item.objects.filter(item_name='Smoodh') #will give all objects with item_id=21
#item.objects.filter(item_name__startswith='S').delete() #will delete all objects with item_name starting with 'S'
#item.objects.filter(item_id=12).update(item_name='Pastha') #will update all objects with item_name to Pastha where item_id=12