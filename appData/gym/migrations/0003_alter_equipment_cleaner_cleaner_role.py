# Generated by Django 4.1.3 on 2022-12-09 03:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gym', '0002_remove_activity_gym'),
    ]

    operations = [
        migrations.AlterField(
            model_name='equipment_cleaner',
            name='cleaner_role',
            field=models.CharField(max_length=120),
        ),
    ]
