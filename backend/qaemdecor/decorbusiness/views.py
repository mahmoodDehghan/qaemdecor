from django.shortcuts import render
from rest_framework import viewsets
from .models import DecorCategory, MainCategory, DecorSample
from .models import Customer
from .models import OrderCategory, Order
from .serializers import DecorCategorySerializer
from .serializers import MainCategorySerializer
from .serializers import DecorSampleSerializer
from .serializers import CustomerSerializer
from .serializers import OrderCategorySerializer
from .serializers import OrderSerializer
from rest_framework.permissions import AllowAny
from rest_framework import generics


# Create your views here.
class MainCategoryViewSet(viewsets.ModelViewSet):
  permission_classes = [AllowAny]
  queryset = MainCategory.objects.all()
  serializer_class = MainCategorySerializer


class DecorCategoryViewSet(viewsets.ModelViewSet):
  permission_classes = [AllowAny]
  queryset = DecorCategory.objects.all()
  serializer_class = DecorCategorySerializer



class DecorSampleViewSet(viewsets.ModelViewSet):
  permission_classes = [AllowAny]
  queryset = DecorSample.objects.all()
  serializer_class = DecorSampleSerializer


class CustomerViewSet(viewsets.ModelViewSet):
  permission_classes = [AllowAny]
  queryset = Customer.objects.all()
  serializer_class = CustomerSerializer



class OrderCategoryViewSet(viewsets.ModelViewSet):
  permission_classes = [AllowAny]
  queryset = OrderCategory.objects.all()
  serializer_class = OrderCategorySerializer



class OrderCreateView(generics.CreateAPIView):
  permission_classes = [AllowAny]
  queryset = Order.objects.all()
  serializer_class = OrderSerializer



class OrderDetailEditView(generics.RetrieveUpdateDestroyAPIView):
  permission_classes = [AllowAny]
  queryset = Order.objects.all()
  serializer_class = OrderSerializer



class OrdersListGet(generics.ListAPIView):
  permission_classes = [AllowAny]
  queryset = Order.objects.all()
  serializer_class = OrderSerializer