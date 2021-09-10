# Generated by Django 3.2.5 on 2021-08-30 10:54

from django.db import migrations, models
import django.db.models.deletion
import main.models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_logoimage'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImageCategory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Images',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('imageFile', models.ImageField(blank=True, null=True, upload_to=main.models.nameFile)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.imagecategory')),
            ],
        ),
        migrations.AddField(
            model_name='slidepage',
            name='images',
            field=models.ManyToManyField(to='main.Images'),
        ),
    ]