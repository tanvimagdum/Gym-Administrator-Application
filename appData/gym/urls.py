from django.urls import path
from gym import views

urlpatterns = [ 
    path("", views.home, name="home"),
    path('memberAndTrainer/', views.memberAndTrainer),
    path('equipmentAndCleaner/', views.equipmentAndCleaner),
    path('activityRoomAndGym/', views.activityRoomAndGym),
    path('EnterMember/', views.EnterMember),
    path('EnterRoom/', views.EnterRoom),
    path('EnterEquipment/', views.EnterEquipment),
    path('EnterEquipment_cleaner/', views.EnterEquipment_cleaner),
    path('EnterTrainer/', views.EnterTrainer),
    path('EnterActivity/', views.EnterActivity),
    path('EnterMemberToActivity/', views.EnterMemberToActivity),
    path('EnterTrainerToActivity/', views.EnterTrainerToActivity),
    path('EnterCleanerToEquipment/', views.EnterCleanerToEquipment),
    path('EnterGym/', views.EnterGym),
    path('showMember/', views.showMember),
    path('showTrainer/', views.showTrainer),
    path('showEquipment/', views.showEquipment),
    path('showEquipmentCleaner/', views.showEquipmentCleaner),
    path('showActivity/', views.showActivities),
    path('deleteMember/', views.deleteMember),
    path('deleteTrainer/', views.deleteTrainer),
    path('deleteActivity/', views.deleteActivity),
    path('deleteEquipment/', views.deleteEquipment),

    path('deleteEquipmentCleaner/', views.deleteEquipmentCleaner),

    path('updateTrainer/', views.updateTrainer),
    path('updateMember/', views.updateMember),
    path('updateEquipmentCleaner/', views.updateEquipmentCleaner),
    path('ajax/load-trainers/', views.load_trainers, name='ajax_load_trainers'),
        

    path('ajax/load-equipment/', views.load_equipment, name='ajax_load_equipment'),

    path('ajax/load-trainer-activities/', views.load_trainer_activities, name='ajax_load_trainer_activities'),

    path('ajax/load-activities/', views.load_activities, name='ajax_load_activities'),

]