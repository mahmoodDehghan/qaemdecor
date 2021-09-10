from django.contrib import admin
from .models import DecorCategory, MainCategory, DecorSample
from .models import Customer
from .models import OrderCategory, Order


class DecorCategoryAdmin(admin.ModelAdmin):
  pass


class MainCategoryAdmin(admin.ModelAdmin):
  pass



class CustomerAdmin(admin.ModelAdmin):
  pass


class DecorSampleAdmin(admin.ModelAdmin):
  pass


class OrderCategoryAdmin(admin.ModelAdmin):
  pass


class OrderAdmin(admin.ModelAdmin):
  pass

# Register your models here.
admin.site.register(DecorSample, DecorSampleAdmin)
admin.site.register(DecorCategory, DecorCategoryAdmin)
admin.site.register(MainCategory, MainCategoryAdmin)
admin.site.register(Customer, CustomerAdmin)
admin.site.register(OrderCategory, OrderCategoryAdmin)
admin.site.register(Order, OrderAdmin)