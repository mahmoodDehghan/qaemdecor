# Generated by Django 3.2.5 on 2021-08-24 12:04

from django.db import migrations, models
import main.models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_alter_slidepage_title'),
    ]

    operations = [
        migrations.CreateModel(
            name='LogoImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('imageFile', models.ImageField(blank=True, null=True, upload_to=main.models.nameFile)),
            ],
        ),
    ]