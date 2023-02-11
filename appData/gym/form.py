from django import forms  
from gym.models import member, activity, trainer, gym,member_to_activity,equipment_to_equipment_cleaner,trainer_to_activity
from gym.models import member,equipment_cleaner,equipment,room

class memberForm(forms.ModelForm):  
    class Meta:  
        model = member
        fields = ("__all__")
        labels = {
            "member_name" : "Member Name",
            "member_dob"  : "Member Date Of Birth in format YYYY-MM-DD",
            "member_phone" : "Phone Number",
            "member_height"  : "Height in cms",
            "member_weight" : "Weight in lbs",
            "gym":"Gym Name",
            "trainer":"Trainer Name"
                }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['trainer'].queryset = trainer.objects.none() 
        


class activityForm(forms.ModelForm):  
    class Meta:  
        model = activity
        fields = ("__all__")
        labels = {
            "activity_name" : "Activity Name",
            "activity_duration"  : "Activity duration in minutes",
            "activity_calories_burnt" : "Number of calories burnt",
            "room" : "Room Number"
                }   



class trainerForm(forms.ModelForm):  
    class Meta:  
        model = trainer
        fields = ("__all__")
        labels = {
            "trainer_name" : "Trainer Name",
            "trainer_address"  : "Trainer address",
            "trainer_phone" : "Trainer Phone Number",
            "trainer_working_hours" : "Number of working hours",
            "gym":"Gym Name"
                } 

class equipment_cleaner_form(forms.ModelForm):  
    class Meta:  
        model = equipment_cleaner
        fields = ("__all__")
        labels = {
            "cleaner_name" : "Cleaner Name",
            "cleaner_address"  : "Cleaner Address",
            "cleaner_phone" : "Cleaner Phone",
            "cleaner_role"  : "Cleaner Role",
            "gym":"Gym Name"
                }        


class equipment_form(forms.ModelForm):  
    class Meta:  
        model = equipment
        fields = ("__all__")
        labels = {
            "equipment_name" : "Equipment Name",
            "equipment_weight"  : "Equipment Weight in lbs",
            "equipment_brand" : "Equipment Brand",
            "room":"Room Number"
                }   

class room_form(forms.ModelForm):  
    class Meta:  
        model = room
        fields = ("__all__")
        labels = {
            "room_number" : "Room Number",
            "room_capactiy"  : "Room Capacity",
            "gym":"Gym Name"
                }                   

class gym_form(forms.ModelForm):  
    class Meta:  
        model = gym
        fields = ("__all__")
        labels = {
            "gym_name" : "Gym Name",
            "gym_address"  : "Gym Address",
            "gym_phone":"Gym Phone Number"
                }


class memberToActivity(forms.ModelForm):
    class Meta:  
        model = member_to_activity
        fields = ("__all__")
        labels = {
            "member" : "Member Name",
            "activity"  : "Activity Name"
                }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['activity'].queryset = activity.objects.none()


class trainerToActivity(forms.ModelForm):
    class Meta:  
        model = trainer_to_activity
        fields = ("__all__")
        labels = {
            "trainer" : "Trainer Name",
            "activity"  : "Activity Name"
                }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['trainer'].queryset = trainer.objects.none()        

class equipmentToEquipmentCleaner(forms.ModelForm):
    class Meta:  
        model = equipment_to_equipment_cleaner
        fields = ("__all__")
        labels = {
            "equipment" : "Equipment Name",
            "equipment_cleaner"  : "Equipment Cleaner Name"
                }                  
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        self.fields['equipment'].queryset = equipment.objects.none() 