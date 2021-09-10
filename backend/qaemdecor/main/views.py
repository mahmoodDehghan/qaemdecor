from django.http.response import Http404
# from django.shortcuts import render
# from rest_framework.decorators import api_view, authentication_classes, permission_classes
# from rest_framework.authentication import BaseAuthentication
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import SlideType, SlidePage  
from .models import ImageCategory, LogoImage, Images  
from .serializers import ImageCategorySerializer, SlideTypeSerializer, SlidePageSerializer  
from .serializers import LogoImageSerializer, ImageCategory, ImagesSerializer
from rest_framework import status
from rest_framework import viewsets

# Create your views here.
class SlideTypes(APIView):
  
  
  def get(self, request, format=None):
    slidTypes = SlideType.objects.all()
    serializer = SlideTypeSerializer(slidTypes, many=True)
    return Response(serializer.data)
  
  def post(self, request, format=None):
    serializer = SlideTypeSerializer(data=request.data)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class ShowSlidePages(APIView):
  permission_classes = [AllowAny]

  def get(self, request, format=None):
    slidePages = SlidePage.objects.all()
    serializer = SlidePageSerializer(slidePages, many=True)
    return Response(serializer.data)


class ShowLogoImage(APIView):
  permission_classes = [AllowAny]

  def get_object(self, name):
    try:
      return LogoImage.objects.get(name=name)
    except:
      raise Http404

  def get(self, request,name, format=None):
    logo = self.get_object(name=name)
    serializer = LogoImageSerializer(logo)
    return Response(serializer.data, status=status.HTTP_200_OK)


class EditLogoImage(APIView):
  def get_object(self, name):
    try:
      return LogoImage.objects.get(name=name)
    except:
      raise Http404


  def put(self,request, name, format=None):
    logo = self.get_object(name=name)
    serializer = LogoImageSerializer(logo, data=request.data)
    if(serializer.is_valid()):
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    


class ImageTypesView(APIView):
  permission_classes = [AllowAny]
  
  
  def get(self, request, format=None):
    imageCategories = ImageCategory.objects.all()
    serializer = ImageCategorySerializer(imageCategories,
     many=True)
    return Response(serializer.data)


  def post(self, request, format=None):
    serializer = ImageCategorySerializer(data=request.data)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
  


class SpecialImageTypeView(APIView):
  permission_classes = [AllowAny]

  def get_object(self, pk):
    try:
      return ImageCategory.objects.get(id=pk)
    except:
      raise Http404


  def get(self, request,pk, format=None):
    imageCategory = self.get_object(pk)
    serializer = ImageCategorySerializer(imageCategory)
    return Response(serializer.data, status=status.HTTP_200_OK)
  


class ImagesViewSet(viewsets.ModelViewSet):
  permission_classes=[AllowAny]
  queryset = Images.objects.all()
  serializer_class = ImagesSerializer
