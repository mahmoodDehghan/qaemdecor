from django.db import router
from django.urls import re_path, path
from django.urls.conf import include
from .views import SlideTypes, ShowSlidePages, ShowLogoImage, EditLogoImage
from .views import ImageTypesView, SpecialImageTypeView, ImagesViewSet
from rest_framework.routers import DefaultRouter


router = DefaultRouter()
router.register(r'images',ImagesViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('slidetypes/', SlideTypes.as_view()),
    path('slidepages/', ShowSlidePages.as_view()),
    path('showlogo/<str:name>',ShowLogoImage.as_view()),
    path('editlogo/<str:name>',EditLogoImage.as_view()),
    path('imagetypes/', ImageTypesView.as_view()),
    path('specialimage/<int:pk>', SpecialImageTypeView.as_view()),
    path('decor/', include('decorbusiness.urls'))
]
