from django.db import router
from django.urls import path
from django.urls.conf import include
from rest_framework.routers import DefaultRouter
from .views import DecorCategoryViewSet, MainCategoryViewSet
from .views import DecorSampleViewSet, CustomerViewSet
from .views import OrderCategoryViewSet
from .views import OrderCreateView, OrdersListGet
from .views import OrderDetailEditView

router = DefaultRouter()
router.register(r'categories', DecorCategoryViewSet)
router.register(r'maincategories', MainCategoryViewSet)
router.register(r'samples', DecorSampleViewSet)
router.register(r'customers', CustomerViewSet)
router.register(r'ordercategories', OrderCategoryViewSet)

urlpatterns = [
  path('', include(router.urls)),
  path('createorder', OrderCreateView.as_view()),
  path('orders/', OrdersListGet.as_view()),
  path('orders/<int:pk>/', OrderDetailEditView.as_view())  
]
