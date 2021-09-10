from django.contrib import admin

from .models import User, SlideType, SlidePage, LogoImage, ImageCategory, Images

# Register your models here.
class UserAdmin(admin.ModelAdmin):
  pass


class SlideTypeAdmin(admin.ModelAdmin):
  pass



class SlidePageAdmin(admin.ModelAdmin):
  pass


class LogoImageAdmin(admin.ModelAdmin):
  pass



class ImageCategoryAdmin(admin.ModelAdmin):
  pass    


class ImagesAdmin(admin.ModelAdmin):
      pass


admin.site.register(User,UserAdmin)
admin.site.register(SlideType,SlideTypeAdmin)
admin.site.register(SlidePage,SlidePageAdmin)
admin.site.register(LogoImage, LogoImageAdmin)
admin.site.register(Images, ImagesAdmin)
admin.site.register(ImageCategory, ImageCategoryAdmin)