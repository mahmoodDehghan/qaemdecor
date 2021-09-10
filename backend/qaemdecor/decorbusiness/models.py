from django.db import models
from main.models import Images 

# Create your models here.
class DecorCategory(models.Model):
  name = models.CharField(max_length=100)


class MainCategory(models.Model):
  name = models.CharField(max_length=100)
      



class Customer(models.Model):
  fullname = models.CharField(max_length=200)
  age = models.SmallIntegerField()
  gender = models.CharField(max_length=50)
  address = models.CharField(max_length=300)
  date_added = models.DateField(auto_now_add=True)
  phoneNumber = models.CharField(max_length=100)
  income = models.DecimalField(max_digits=20, decimal_places=10)


class DecorSample(models.Model):
  category = models.ForeignKey(DecorCategory, on_delete=models.CASCADE)
  mainCategory= models.ForeignKey(MainCategory, on_delete=models.CASCADE)
  title = models.CharField(max_length=100)
  description = models.TextField()
  addedDate = models.DateTimeField(auto_now_add=True)
  customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
  images = models.ManyToManyField(Images)


class OrderCategory(models.Model):
  name = models.CharField(max_length=100)


class Order(models.Model):
  category = models.ForeignKey(OrderCategory, on_delete=models.CASCADE)
  customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
  registerDate = models.DateTimeField(auto_now_add=True)
  modifyDate = models.DateTimeField(auto_now=True)
  orderStatus = models.CharField(max_length=50)
  income = models.DecimalField(blank=True, max_digits=20, decimal_places=10)
  cost = models.DecimalField(blank=True, max_digits=20, decimal_places=10)
  profit = models.DecimalField(blank=True, max_digits=20 ,decimal_places=10)
