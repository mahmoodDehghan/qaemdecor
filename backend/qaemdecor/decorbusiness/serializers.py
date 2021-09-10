from django.db.models import fields
from rest_framework import serializers
from .models import DecorCategory, MainCategory, DecorSample
from .models import Customer
from .models import OrderCategory, Order

class DecorCategorySerializer(serializers.ModelSerializer):
  class Meta:
    model = DecorCategory
    fields = ['id', 'name']



class MainCategorySerializer(serializers.ModelSerializer):
  class Meta:
    model = MainCategory
    fields = ['id', 'name']



class DecorSampleSerializer(serializers.ModelSerializer):
  class Meta:
    model = DecorSample
    fields = ['id', 'category', 'mainCategory', 'title', 'description', 'customer', 'images']



class CustomerSerializer(serializers.ModelSerializer):
  class Meta:
    model = Customer
    fields = ['id', 'fullname', 'age', 'gender', 'address', 'phoneNumber', 'income']


class OrderCategorySerializer(serializers.ModelSerializer):
  class Meta:
    model = OrderCategory
    fields = ['id', 'name']



class OrderSerializer(serializers.ModelSerializer):
  class Meta:
    model = Order
    fields = ['id', 'category', 'customer', 'registerDate',
     'lastChangeDate', 'orderStatus', 'income', 'cost', 'profit']