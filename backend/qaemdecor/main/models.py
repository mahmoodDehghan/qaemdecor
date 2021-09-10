from os import name
from django.db import models
from django.contrib.auth.models import AbstractUser
from translator.models import Word


# Create your models here.
class User(AbstractUser):
  pass

class SlideType(models.Model):
  name = models.CharField(max_length=50)

  def __str__(self):
      return self.name





def nameFile(instance, filename):
    return '/'.join(['images', str(instance.name), filename])

class LogoImage(models.Model):
  name = models.CharField(max_length=100)
  imageFile = models.ImageField(upload_to=nameFile, blank=True, null=True)

  def __str__(self) -> str:
      return f'{self.name}'



class ImageCategory(models.Model):
  name= models.CharField(max_length=100)

  def __str__(self) -> str:
      return f'{self.name}'



class Images(models.Model):
  name = models.CharField(max_length=100)
  category = models.ForeignKey(ImageCategory, on_delete=models.CASCADE)
  imageFile = models.ImageField(upload_to=nameFile, blank=True, null=True)
  
  def __str__(self) -> str:
      return f'{self.name} - path: {self.imageFile}' 



class SlidePage(models.Model):
  title = models.CharField(max_length=100)
  slide_type = models.ForeignKey(SlideType, on_delete=models.CASCADE)
  link = models.CharField(max_length=200, blank=True)
  index = models.IntegerField()
  images = models.ManyToManyField(Images)

  def __str__(self) -> str:
      return f'{self.index}:{self.title}'