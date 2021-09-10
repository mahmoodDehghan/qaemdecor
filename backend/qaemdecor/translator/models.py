from django.db import models
from django.db.models.fields import CharField

# Create your models here.
class Language(models.Model):
  name = models.CharField(max_length=100)
  abbreviation = models.CharField(max_length=20)


  def __str__(self) -> str:
      return self.name



class Word(models.Model):
  word = models.CharField(max_length=200)
  defaut_language = models.ForeignKey(Language, on_delete=models.CASCADE)

  def __str__(self):
      return self.word
  

class Trans(models.Model):
  word = models.ForeignKey(Word, on_delete=models.CASCADE)
  language = models.ForeignKey(Language, on_delete=models.CASCADE)
  trans = models.CharField(max_length=200)

  def __str__(self):
    return f'{self.word} in {self.language} : {self.trans}'

