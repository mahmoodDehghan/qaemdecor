from django.contrib import admin

from .models import Language, Trans, Word

# Register your models here.
class WordAdmin(admin.ModelAdmin):
  pass



class LanguageAdmin(admin.ModelAdmin):
  pass



class TransAdmin(admin.ModelAdmin):
  pass


admin.site.register(Word,WordAdmin)
admin.site.register(Language,LanguageAdmin)
admin.site.register(Trans,TransAdmin)