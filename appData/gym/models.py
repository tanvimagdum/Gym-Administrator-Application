from django.db import models

# Create your models here.


#from __future__ import unicode_literals  


class member(models.Model):
    member_name  = models.CharField(max_length = 50, null = False)
    member_dob  = models.CharField(max_length =10, null = False)
    member_phone = models.CharField(max_length=10, null = False)
    member_height  = models.FloatField( null = False)
    member_weight = models.FloatField( null = False)
    trainer=models.ForeignKey("trainer",on_delete=models.CASCADE)
    gym=models.ForeignKey("gym",on_delete=models.CASCADE)
    def __str__(self):
       return self.member_name


class equipment_cleaner(models.Model):
    cleaner_name  = models.CharField(max_length = 50, null = False)
    cleaner_address  = models.CharField(max_length = 120, null = False)
    cleaner_phone = models.CharField(max_length=10, null = False)
    cleaner_role  = models.CharField(max_length = 120, null = False)
    gym=models.ForeignKey("gym",on_delete=models.CASCADE)
    def __str__(self):
       return self.cleaner_name


class equipment(models.Model):
    equipment_name  = models.CharField(max_length = 50, null = False)
    equipment_weight  = models.IntegerField( null = False)
    equipment_brand = models.CharField(max_length=120, null = False)
    room=models.ForeignKey("room",on_delete=models.CASCADE)
    def __str__(self):
       return self.equipment_name


class room(models.Model):
    room_number=models.IntegerField( null = False,unique=True)
    room_capacity=models.IntegerField( null=False)
    gym=models.ForeignKey("gym",on_delete=models.CASCADE)
    def __str__(self):
       return str(self.room_number)



class activity(models.Model):
    activity_name  = models.CharField(max_length=50, null=False)
    activity_duration = models.IntegerField(null=False)
    activity_calories_burnt = models.FloatField(null=False)
    room=models.ForeignKey("room",on_delete=models.CASCADE)
    
    def __str__(self):
       return self.activity_name



class trainer(models.Model):
    trainer_name = models.CharField(max_length=50, null=False)
    trainer_address = models.CharField(max_length=120, null=False)
    trainer_phone = models.CharField(max_length=10, null=False)
    trainer_working_hours = models.FloatField(null=False)
    gym=models.ForeignKey("gym",on_delete=models.CASCADE)
    def __str__(self):
       return self.trainer_name


class gym(models.Model):
    gym_name = models.CharField(max_length=50, null=False)
    gym_address = models.CharField(max_length=120, null=False)
    gym_phone = models.CharField(max_length=10, null=False)
    def __str__(self):
       return self.gym_name

class member_to_activity(models.Model):
    member=models.ForeignKey("member",on_delete=models.CASCADE)
    activity=models.ForeignKey("activity",on_delete=models.CASCADE)
    def __str__(self):
       return self.id

class trainer_to_activity(models.Model):
    trainer=models.ForeignKey("trainer",on_delete=models.CASCADE)
    activity=models.ForeignKey("activity",on_delete=models.CASCADE)
    def __str__(self):
       return self.id

class equipment_to_equipment_cleaner(models.Model):
    equipment=models.ForeignKey("equipment",on_delete=models.CASCADE)
    equipment_cleaner=models.ForeignKey("equipment_cleaner",on_delete=models.CASCADE)
    def __str__(self):
       return self.id