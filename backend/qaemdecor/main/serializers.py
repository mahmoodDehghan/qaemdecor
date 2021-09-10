from django.contrib.auth.models import User
from django.db import models
from .models import Images, SlideType, SlidePage, LogoImage, ImageCategory
from rest_framework import fields, serializers

# class UserSerializer(serializers.H)
class SlideTypeSerializer(serializers.ModelSerializer):
  class Meta:
    model = SlideType
    fields = ['id', 'name']



class SlidePageSerializer(serializers.ModelSerializer):
  class Meta:
    model = SlidePage
    fields = ['id', 'title', 'slide_type', 'link', 'index']


class LogoImageSerializer(serializers.ModelSerializer):
  class Meta:
    model = LogoImage
    fields = ['name', 'imageFile']


class ImageCategorySerializer(serializers.ModelSerializer):
  class Meta:
    model = ImageCategory
    fields = ['id','name']



class ImagesSerializer(serializers.ModelSerializer):
  class Meta:
    model = Images
    fields = ['id', 'name', 'category', 'imageFile']