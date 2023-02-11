from django.shortcuts import render
from gym.models import member,trainer,activity,equipment,equipment_cleaner,room,gym
# Create your views here.
from gym.form import  memberForm,equipment_cleaner_form,equipment_form,room_form,trainerForm,gym_form,activityForm,memberToActivity,trainerToActivity,equipmentToEquipmentCleaner
from django.db import connection
import itertools  
import plotly as plt
from plotly.offline import plot
import plotly.graph_objects as go
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
import pandas as pd

def home(request):
    #return HttpResponse("Hello, Django!")
    return render(request, 'home.html') 

def memberAndTrainer(request):
    #return HttpResponse("Hello, Django!")
    return render(request, 'memberAndTrainer.html') 

def equipmentAndCleaner(request):
    #return HttpResponse("Hello, Django!")
    return render(request, 'equipmentAndCleaner.html')

def activityRoomAndGym(request):
    #return HttpResponse("Hello, Django!")
    return render(request, 'activityRoomAndGym.html')     

def EnterTrainer(request):
    submitted = False
    if request.method == 'POST':
        form = trainerForm(request.POST)
        if form.is_valid():
            try:
                name=form.cleaned_data['trainer_name']
                phone=form.cleaned_data['trainer_phone']
                address=form.cleaned_data['trainer_address']
                hours=form.cleaned_data['trainer_working_hours']
                gym=form.cleaned_data['gym']
                
                with connection.cursor() as cursor:
                    cursor.execute("SELECT id FROM gym_schema.gym_gym WHERE gym_name=%s;",[gym])
                    data=cursor.fetchone()
                
                    gym_id=data[0]
                    cursor.callproc("create_trainer",[name,address,phone,hours,gym_id])
                return HttpResponseRedirect('/') 
            except:
                errorMessage={
                    "error":"Wrong inputs provided. Please re-enter with valid inputs."
                }
                return render(request,'home.html',errorMessage)


    else:
        form = trainerForm()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'trainer.html', {'form': form, 'submitted': submitted})

def addMemberToDatabase(form):
    member_name=form.data['member_name']
    member_dob=form.data['member_dob']
    member_height=form.data['member_height']
    member_weight=form.data['member_weight']
    member_phone=form.data['member_phone']
    gym_id=form.data['gym']
    trainer_name=form.data['trainer']
    if(not(member_name is None or member_dob is None or member_height is None or member_weight is None or member_phone is None or gym_id is None or trainer_name is None)):
        with connection.cursor() as cursor: 
            cursor.execute("SELECT id FROM gym_schema.gym_trainer WHERE trainer_name=%s;",[trainer_name])
            data=cursor.fetchone()
            
            trainer_id=data[0]
            cursor.callproc("create_member",[member_name,member_dob,member_phone,member_height,member_weight,gym_id,trainer_id]) 


def addMemberToActivityToDatabase(form):
    member_name=form.data['member']
    activity=form.data['activity']
   
    if(member_name is  not None and activity is not None):
       
            with connection.cursor() as cursor: 
                cursor.execute("SELECT id FROM gym_schema.gym_activity WHERE activity_name=%s;",[activity])
                data=cursor.fetchone()
                
                activity_id=data[0]
                cursor.callproc("create_mem_to_act",[activity_id,member_name])
        



def addTrainerToActivityToDatabase(form):
    
    activity=form.data['activity']
    trainer_name=form.data['trainer']   
    if(trainer_name is  not None and activity is not None):
       
            with connection.cursor() as cursor: 
                cursor.execute("SELECT id FROM gym_schema.gym_trainer WHERE trainer_name=%s;",[trainer_name])
                data=cursor.fetchone()
                
                trainer_id=data[0]
                cursor.callproc("create_tr_to_act",[activity,trainer_id])
        
            



def addEquipmentToCleanerToDatabase(form):
    
    cleaner=form.data['equipment_cleaner']
    equipment_name=form.data['equipment']   
    if(equipment_name is  not None and cleaner is not None):
        
            with connection.cursor() as cursor: 
                cursor.execute("SELECT id FROM gym_schema.gym_equipment WHERE equipment_name=%s;",[equipment_name])
                data=cursor.fetchone()
                
                equipment_id=data[0]
                cursor.callproc("create_eq_to_eqcl",[equipment_id,cleaner])
        
                

                         



def EnterMember(request):
    submitted = False
    if request.method == 'POST':
        form = memberForm(request.POST)
        try:
             addMemberToDatabase(form)
        except:
                errorMessage={
                    "error":"Wrong inputs provided. Please re-enter with valid inputs."
                }
                return render(request,'home.html',errorMessage)

        return HttpResponseRedirect('/') 
    else:
        form = memberForm()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'member.html', {'form': form, 'submitted': submitted})


def EnterActivity(request):
    submitted = False
    if request.method == 'POST':
        form = activityForm(request.POST)
        if form.is_valid():
            
            name=form.cleaned_data['activity_name']
            duration=form.cleaned_data['activity_duration']
            calories=form.cleaned_data['activity_calories_burnt']
            room=form.cleaned_data['room']
            
            with connection.cursor() as cursor:
                try:
                    cursor.execute("SELECT id FROM gym_schema.gym_room WHERE room_number=%s;",[room])
                    data=cursor.fetchone()
                
                    room_id=data[0]
                    cursor.callproc("create_activity",[name,duration,calories,room_id])
                except:
                    errorMessage={
                        "error":"Wrong inputs provided. Please re-enter with valid inputs."
                    }
                    return render(request,'home.html',errorMessage)
                    
            return HttpResponseRedirect('/') 
    else:
        form = activityForm()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'activity.html', {'form': form, 'submitted': submitted})

def EnterGym(request):
    submitted = False
    if request.method == 'POST':
        form = gym_form(request.POST)
        if form.is_valid():
            name=form.cleaned_data['gym_name']
            address=form.cleaned_data['gym_address']
            phone=form.cleaned_data['gym_phone']
           
            with connection.cursor() as cursor:
                try:
                    cursor.callproc("create_gym",[name,address,phone])
                except:
                    errorMessage={
                        "error":"Wrong inputs provided. Please re-enter with valid inputs."
                    }
                    return render(request,'home.html',errorMessage)


            
            return HttpResponseRedirect('/') 
    else:
        form = gym_form()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'gym.html', {'form': form, 'submitted': submitted})

def EnterEquipment(request):
    submitted = False
    if request.method == 'POST':
        form = equipment_form(request.POST)
        if form.is_valid():
            name=form.cleaned_data['equipment_name']
            weight=form.cleaned_data['equipment_weight']
            brand=form.cleaned_data['equipment_brand']
            room=form.cleaned_data['room']
            try:
                with connection.cursor() as cursor:
                    cursor.execute("SELECT id FROM gym_schema.gym_room WHERE room_number=%s;",[room])
                    data=cursor.fetchone()
                
                    room_id=data[0]
                    cursor.callproc("create_equipment",[name,weight,brand,room_id])
            except:
                    errorMessage={
                        "error":"Wrong inputs provided. Please re-enter with valid inputs."
                    }
                    return render(request,'home.html',errorMessage)
            return HttpResponseRedirect('/') 
    else:
        form = equipment_form()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'equipment.html', {'form': form, 'submitted': submitted})


def EnterEquipment_cleaner(request):
    submitted = False
    if request.method == 'POST':
        form = equipment_cleaner_form(request.POST)
        if form.is_valid():
            name=form.cleaned_data['cleaner_name']
            address=form.cleaned_data['cleaner_address']
            phone=form.cleaned_data['cleaner_phone']
            role=form.cleaned_data['cleaner_role']
            gym=form.cleaned_data['gym']
            try:
                with connection.cursor() as cursor:
                    cursor.execute("SELECT id FROM gym_schema.gym_gym WHERE gym_name=%s;",[gym])
                    data=cursor.fetchone()
                
                    gym_id=data[0]
                    cursor.callproc("create_equipment_cleaner",[name,address,phone,role,gym_id])
            except:
                    errorMessage={
                        "error":"Wrong inputs provided. Please re-enter with valid inputs."
                    }
                    return render(request,'home.html',errorMessage)
            return HttpResponseRedirect('/') 
    else:
        form = equipment_cleaner_form()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'equipment_cleaner.html', {'form': form, 'submitted': submitted})

def EnterRoom(request):
    submitted = False
    if request.method == 'POST':
        form = room_form(request.POST)
        if form.is_valid():
            number=form.cleaned_data['room_number']
            capacity=form.cleaned_data['room_capacity']
            gym=form.cleaned_data['gym']
            try:
                with connection.cursor() as cursor:
                    cursor.execute("SELECT id FROM gym_schema.gym_gym WHERE gym_name=%s;",[gym])
                    data=cursor.fetchone()
                
                    gym_id=data[0]
                    cursor.callproc("create_room",[number,capacity,gym_id])
            except:
                    errorMessage={
                        "error":"Wrong inputs provided. Please re-enter with valid inputs."
                    }
                    return render(request,'home.html',errorMessage)
            return HttpResponseRedirect('/') 
    else:
        form = room_form()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'room.html', {'form': form, 'submitted': submitted})



def EnterMemberToActivity(request):
    submitted = False
    if request.method == 'POST':
        form =memberToActivity (request.POST)
        try:
            addMemberToActivityToDatabase(form)
        except:
                    errorMessage={
                        "error":"Wrong inputs provided. Please re-enter with valid inputs."
                    }
                    return render(request,'home.html',errorMessage)
        return HttpResponseRedirect('/') 
    else:
        form = memberToActivity()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'memberToActivity.html', {'form': form, 'submitted': submitted})   


 
def EnterTrainerToActivity(request):
    submitted = False
    if request.method == 'POST':
        form =trainerToActivity (request.POST)
        try:
            addTrainerToActivityToDatabase(form)
        except:
                    errorMessage={
                        "error":"Wrong inputs provided. Please re-enter with valid inputs."
                    }
                    return render(request,'home.html',errorMessage)
        return HttpResponseRedirect('/') 
    else:
        form = trainerToActivity()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'trainerToActivity.html', {'form': form, 'submitted': submitted})   


 
def EnterCleanerToEquipment(request):
    submitted = False
    if request.method == 'POST':
        form =equipmentToEquipmentCleaner (request.POST)
        try:
            addEquipmentToCleanerToDatabase(form)
        except:
                    errorMessage={
                        "error":"Wrong inputs provided. Please re-enter with valid inputs."
                    }
                    return render(request,'home.html',errorMessage)
        return HttpResponseRedirect('/') 
    else:
        form = equipmentToEquipmentCleaner()
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'CleanerToEquipment.html', {'form': form, 'submitted': submitted})          


def showMember(request):
    df=dfn = pd.DataFrame(columns = ['Member ID', 'Name','Gym','Number','Trainer']) 
   
    if request.method == 'GET':
       

       for m in member.objects.raw('SELECT * FROM gym_member;'):
        
            df = df.append({'Member ID':m.id,'Name':m.member_name ,'Number':m.member_phone, 
            'Gym':m.gym.gym_name,'Trainer':m.trainer.trainer_name}, ignore_index=True)        
            
            
            plotlyDict=showtableMember(df)
            return render(request,"showMember.html",plotlyDict)
       return render(request,"showMember.html",plotlyDict) 
    elif request.method == 'POST':
        name  = request.POST['name']
        trainer_l  = request.POST['trainer']
        gym_l  = request.POST['gym']             
        
        if name:
            
            with connection.cursor() as cursor:
              
                cursor.callproc("read_member_by_name",[name])
                dataBig = cursor.fetchall()
                
                for data in dataBig:
                    
                    dfn = dfn.append({'Member ID':data[0],'Name':data[1] ,'Number':data[3], 
                    'Gym':data[5],'Trainer':data[6]}, ignore_index=True)
                

       
        elif trainer_l:
            with connection.cursor() as cursor:
              
                cursor.callproc("read_member_by_trainer",[trainer_l])
                dataBig = cursor.fetchall()
                for data in dataBig:
                    
                    dfn = dfn.append({'Member ID':data[0],'Name':data[1] ,'Number':data[3], 
                    'Gym':data[5],'Trainer':data[6]}, ignore_index=True)
                
        elif gym_l:
            with connection.cursor() as cursor:
              
                cursor.callproc("read_member_by_gym",[gym_l])
                dataBig = cursor.fetchall()
                
              
                for data in dataBig:
                    dfn = dfn.append({'Member ID':data[0],'Name':data[1] ,'Number':data[3], 
                    'Gym':data[5],'Trainer':data[6]}, ignore_index=True)
                
        else:
            for m in member.objects.raw('SELECT * FROM gym_member;'):
        
                df = df.append({'Member ID':m.id,'Name':m.member_name ,'Number':m.member_phone, 
                'Gym':m.gym.gym_name,'Trainer':m.trainer.trainer_name}, ignore_index=True)        
            #df=getDataframeMember(membersAge,membersName,membersNumber)
            
            plotlyDict=showtableMember(df)
            return render(request, "showMember.html",plotlyDict)
        
                
        
        plotlyDict=showtableMember(dfn)
        return render(request,"showMember.html",plotlyDict)



def showTrainer(request):
    df =dfn= pd.DataFrame(columns = ['Trainer ID', 'Name','Gym','Number']) 
   
    if request.method == 'GET':
       

      #do_something()
        for t in trainer.objects.raw('SELECT * FROM gym_trainer;'):
        
            
            df = df.append({'Trainer ID':t.id,'Name':t.trainer_name ,'Gym': t.gym.gym_name
            ,'Number':t.trainer_phone}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableTrainer(df)
        return render(request,"showTrainer.html",plotlyDict) 
    elif request.method == 'POST':
        name  = request.POST['name']
        
        gym_l  = request.POST['gym']             
        
        if name:
            
            with connection.cursor() as cursor:
              
                cursor.callproc("read_trainer_by_name",[name])
                dataBig = cursor.fetchall()
                for data in dataBig:
                    
                    dfn = dfn.append({'Trainer ID':data[0],'Name':data[1] ,'Gym': data[5]
                    ,'Number':data[3]}, ignore_index=True)
                

       
        
        elif gym_l:
            with connection.cursor() as cursor:
              
                cursor.callproc("read_trainer_by_gym",[gym_l])
                dataBig = cursor.fetchall()
                
              
                for data in dataBig:
                    
                    dfn = dfn.append({'Trainer ID':data[0],'Name':data[1] ,'Gym': data[5]
                    ,'Number':data[3]}, ignore_index=True)
                
        else:
            for t in member.objects.raw('SELECT * FROM gym_trainer;'):
        
                df = df.append({'Trainer ID':t.id,'Name':t.trainer_name ,'Gym': t.gym.gym_name
                     ,   'Number':t.trainer_phone}, ignore_index=True)        
            #df=getDataframeMember(membersAge,membersName,membersNumber)
            
            plotlyDict=showtableTrainer(df)
            return render(request, "showTrainer.html",plotlyDict)
        
                
        
        plotlyDict=showtableTrainer(dfn)
        return render(request,"showTrainer.html",plotlyDict)


def showEquipment(request):
    df = dfn=pd.DataFrame(columns = ['Equipment ID', 'Name','Weight','Room','Brand']) 
   
    if request.method == 'GET':
       

      #do_something()
        for e in equipment.objects.raw('SELECT * FROM gym_equipment;'):
        
            
            df = df.append({'Equipment ID':e.id,'Name':e.equipment_name ,'Weight': e.equipment_weight
            ,'Room':e.room.room_number,'Brand':e.equipment_brand}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableEquipment(df)
        return render(request,"showEquipment.html",plotlyDict) 
    elif request.method == 'POST':
        room  = request.POST['room']
        
        gym_l  = request.POST['gym']             
        
        if room:
            
            with connection.cursor() as cursor:
              
                cursor.callproc("read_equipment_by_room",[room])
                dataBig = cursor.fetchall()
                for data in dataBig:
                    
                    dfn = dfn.append({'Equipment ID':data[0],'Name':data[1] ,'Weight': data[2]
                     ,'Room':data[4],'Brand':data[3]}, ignore_index=True)
                

       
        
        elif gym_l:
            with connection.cursor() as cursor:
              
                cursor.callproc("read_equipment_by_gym",[gym_l])
                dataBig = cursor.fetchall()
                
                
                for data in dataBig:
                    dfn = dfn.append({'Equipment ID':data[0],'Name':data[1] ,'Weight': data[2]
                    ,'Room':data[4],'Brand':data[3]}, ignore_index=True)
                
                
        else:
           for e in equipment.objects.raw('SELECT * FROM gym_equipment;'):
        
            
                df = df.append({'Equipment ID':e.id,'Name':e.equipment_name ,'Weight': e.equipment_weight
                ,'Room':e.room.room_number,'Brand':e.equipment_brand}, ignore_index=True)        
                    
            #df=getDataframeMember(membersAge,membersName,membersNumber)
            
           plotlyDict=showtableEquipment(df)
           return render(request, "showEquipment.html",plotlyDict)
        
                
        
        plotlyDict=showtableEquipment(dfn)
        return render(request,"showEquipment.html",plotlyDict)

def showEquipmentCleaner(request):
    df =dfn= pd.DataFrame(columns = ['EquipmentCleaner ID', 'Name','Phone','Role','Gym']) 
    
    if request.method == 'GET':
        #do_something()
        
        for e in equipment_cleaner.objects.raw('SELECT * FROM gym_equipment_cleaner;'):
        
            
            df = df.append({'EquipmentCleaner ID':e.id,'Name':e.cleaner_name ,'Phone': e.cleaner_phone
            ,'Role':e.cleaner_role,'Gym':e.gym.gym_name}, ignore_index=True)        
        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableEquipmentCleaner(df)
        return render(request,"showEquipmentCleaner.html",plotlyDict)
    elif request.method == 'POST':
        name  = request.POST['name']
        
        if name:
            
            with connection.cursor() as cursor:
              
                cursor.callproc("read_equipment_cleaner_by_name",[name])
                dataBig = cursor.fetchall()
                for data in dataBig:
                    
                    dfn = dfn.append({'EquipmentCleaner ID':e.id,'Name':e.cleaner_name ,'Phone': e.cleaner_phone
                ,'Role':e.cleaner_role,'Gym':e.gym.gym_name}, ignore_index=True)
        else:
           for e in equipment_cleaner.objects.raw('SELECT * FROM gym_equipment_cleaner;'):
                df = df.append({'EquipmentCleaner ID':e.id,'Name':e.cleaner_name ,'Phone': e.cleaner_phone
                ,'Role':e.cleaner_role,'Gym':e.gym.gym_name}, ignore_index=True)        
            
       
           plotlyDict=showtableEquipmentCleaner(df)
           
           return render(request, "showEquipmentCleaner.html",plotlyDict)
        
                
        
        plotlyDict=showtableEquipmentCleaner(dfn)
        return render(request,"showEquipmentCleaner.html",plotlyDict)




def showActivities(request):
    df =dfn= pd.DataFrame(columns = ['Activity ID', 'Name','Gym','Room Number','Calories','Duration']) 
   
    if request.method == 'GET':
        #do_something()
        for a in activity.objects.raw('SELECT * FROM gym_activity;'):
        
            
            df = df.append({'Activity ID':a.id,'Name':a.activity_name 
            ,'Room Number':a.room.room_number,'Calories':a.activity_calories_burnt,'Duration':a.activity_duration}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableActivity(df)
        return render(request,"showActivity.html",plotlyDict)
    elif request.method == 'POST':
        gym  = request.POST['gym']
        
        if gym:
            
            with connection.cursor() as cursor:
              
                cursor.callproc("read_activity_by_gym",[gym])
                dataBig = cursor.fetchall()
                for data in dataBig:
                    
                    dfn = dfn.append({'Activity ID':data[0],'Name':data[1] 
                ,'Room Number':data[4],'Calories':data[3],'Duration':data[2]}, ignore_index=True)
        else:
            for a in activity.objects.raw('SELECT * FROM gym_activity;'):            
                df = df.append({'Activity ID':a.id,'Name':a.activity_name 
                ,'Room Number':a.room.room_number,'Calories':a.activity_calories_burnt,'Duration':a.activity_duration}, ignore_index=True)        
            
        #df=getDataframeMember(membersAge,membersName,membersNumber)
            plotlyDict=showtableActivity(df)
           
            return render(request, "showActivity.html",plotlyDict)
        
                
        
        plotlyDict=showtableActivity(dfn)
        return render(request,"showActivity.html",plotlyDict)




def deleteMember(request):

    df = pd.DataFrame(columns = ['Member ID', 'Name','Gym','Number','Trainer']) 
   
    if request.method == 'GET':
        #do_something()
        for m in member.objects.raw('SELECT * FROM gym_member;'):
        
            
            df = df.append({'Member ID':m.id,'Name':m.member_name ,'Gym': m.gym.gym_name
            ,'Number':m.member_phone,'Trainer':m.trainer.trainer_name}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableMember(df)
        return render(request,"deleteMember.html",plotlyDict)
    elif request.method == 'POST':
      
        id=request.POST['id']
        
        with connection.cursor() as c:
            c.callproc("delete_member",[id])
       
        for m in member.objects.raw('SELECT * FROM gym_member;'):
        
            
            df = df.append({'Member ID':m.id,'Name':m.member_name ,'Gym': m.gym.gym_name
            ,'Number':m.member_phone,'Trainer':m.trainer.trainer_name}, ignore_index=True)  
        plotlyDict=showtableMember(df)
        return render(request,"deleteMember.html",plotlyDict)



def deleteTrainer(request):

    df = pd.DataFrame(columns = ['Trainer ID', 'Name','Gym','Number']) 
   
    if request.method == 'GET':
        #do_something()
        for t in trainer.objects.raw('SELECT * FROM gym_trainer;'):
        
            
            df = df.append({'Trainer ID':t.id,'Name':t.trainer_name ,'Gym': t.gym.gym_name
            ,'Number':t.trainer_phone}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableTrainer(df)
        return render(request,"deleteTrainer.html",plotlyDict)
    elif request.method == 'POST':
      
        id=request.POST['id']
        with connection.cursor() as c:
            c.callproc("delete_trainer",[id])
       
        for t in trainer.objects.raw('SELECT * FROM gym_trainer;'):
        
            
            df = df.append({'Trainer ID':t.id,'Name':t.trainer_name ,'Gym': t.gym.gym_name
            ,'Number':t.trainer_phone}, ignore_index=True)        
        
        plotlyDict=showtableTrainer(df)
        return render(request,"deleteTrainer.html",plotlyDict)

def deleteActivity(request):

    df = pd.DataFrame(columns = ['Activity ID', 'Name','Gym','Room Number','Calories','Duration']) 
   
    if request.method == 'GET':
        #do_something()
        for a in activity.objects.raw('SELECT * FROM gym_activity;'):
        
            
            df = df.append({'Activity ID':a.id,'Name':a.activity_name 
            ,'Room Number':a.room.room_number,'Calories':a.activity_calories_burnt,'Duration':a.activity_duration}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableActivity(df)
        return render(request,"deleteActivity.html",plotlyDict)
    elif request.method == 'POST':
      
        id=request.POST['id']
        with connection.cursor() as c:
            c.callproc("delete_activity",[id])
       
        for a in activity.objects.raw('SELECT * FROM gym_activity;'):
        
            
            df = df.append({'Activity ID':a.id,'Name':a.activity_name 
            ,'Room Number':a.room.room_number,'Calories':a.activity_calories_burnt,'Duration':a.activity_duration}, ignore_index=True)        
        
        plotlyDict=showtableActivity(df)
        return render(request,"deleteActivity.html",plotlyDict)



def deleteEquipment(request):

    df = pd.DataFrame(columns = ['Equipment ID', 'Name','Weight','Room','Brand']) 
   
    if request.method == 'GET':
        #do_something()
        for e in equipment.objects.raw('SELECT * FROM gym_equipment;'):
        
            
            df = df.append({'Equipment ID':e.id,'Name':e.equipment_name ,'Weight': e.equipment_weight
            ,'Room':e.room.room_number,'Brand':e.equipment_brand}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableEquipment(df)
        return render(request,"deleteEquipment.html",plotlyDict)
    elif request.method == 'POST':
      
        id=request.POST['id']
        with connection.cursor() as c:
            c.callproc("delete_equipment",[id])
       
        for e in equipment.objects.raw('SELECT * FROM gym_equipment;'):
        
            
            df = df.append({'Equipment ID':e.id,'Name':e.equipment_name ,'Weight': e.equipment_weight
            ,'Room':e.room.room_number,'Brand':e.equipment_brand}, ignore_index=True)        
        
        plotlyDict=showtableEquipment(df)
        return render(request,"deleteEquipment.html",plotlyDict)




def deleteEquipmentCleaner(request):

    df = pd.DataFrame(columns = ['EquipmentCleaner ID', 'Name','Phone','Role','Gym']) 
   
    if request.method == 'GET':
        #do_something()
        for e in equipment_cleaner.objects.raw('SELECT * FROM gym_equipment_cleaner;'):
        
            
            df = df.append({'EquipmentCleaner ID':e.id,'Name':e.cleaner_name ,'Phone': e.cleaner_phone
            ,'Role':e.cleaner_role,'Gym':e.gym.gym_name}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        plotlyDict=showtableEquipmentCleaner(df)
        return render(request,"deleteEquipmentCleaner.html",plotlyDict)
    elif request.method == 'POST':
      
        id=request.POST['id']
        with connection.cursor() as c:
           c.callproc("delete_equipment_cleaner",[id])
       
        for e in equipment_cleaner.objects.raw('SELECT * FROM gym_equipment_cleaner;'):
        
            
            df = df.append({'EquipmentCleaner ID':e.id,'Name':e.cleaner_name ,'Phone': e.cleaner_phone
            ,'Role':e.cleaner_role,'Gym':e.gym.gym_name}, ignore_index=True)        
        
        plotlyDict=showtableEquipmentCleaner(df)
        return render(request,"deleteEquipmentCleaner.html",plotlyDict)

def showtableMember(df):
    
    fig = go.Figure(data=[go.Table(
    header=dict(values=list(["Member ID", "Name","Number","Gym Name","Trainer Name"]),
                fill_color='paleturquoise',
                align='left'),
    cells=dict(values=[df['Member ID'], df['Name'], df['Number'], df['Gym'],df['Trainer']],
               fill_color='lavender',
               align='left'))
    ])
    plot_div = plot(fig,output_type='div',include_plotlyjs=True)
    plotDict={'plot_div':plot_div}
    return plotDict


def getDataframeMember(membersAge,membersName,membersNumber,membersTime,membersYears):
    df = pd.DataFrame(columns = ['Name', 'Age','Number','Time','Years']) 
    for (a,b,c,d,e) in zip(membersAge,membersName,membersNumber,membersTime,membersYears):
        df = df.append({'Name': b}, ignore_index=True)
        df = df.append({'Age': a}, ignore_index=True)
        df = df.append({'Number': c}, ignore_index=True)
        df = df.append({'Time': d}, ignore_index=True)
        df = df.append({'Years': e}, ignore_index=True)
    return df


def getDataframeTrainer(trainersAge,trainersName,trainersNumber,trainerHours,trainersSalary):
    df = pd.DataFrame(columns = ['Name', 'Age','Number','Hours','Salary']) 
    for (a,b,c,d,e) in zip(trainersAge,trainersName,trainersNumber,trainerHours,trainersSalary):
        df = df.append({'Name': b}, ignore_index=True)
        df = df.append({'Age': a}, ignore_index=True)
        df = df.append({'Number': c}, ignore_index=True)
        df = df.append({'Hours': d}, ignore_index=True)
        df = df.append({'Salary': e}, ignore_index=True)
    

    return df


def showtableTrainer(df):
    fig = go.Figure(data=[go.Table(
    header=dict(values=list(["Trainer ID","Name","Number","Gym Name"]),
                fill_color='paleturquoise',
                align='left'),
    cells=dict(values=[df['Trainer ID'],df['Name'], df['Number'],df['Gym']],
               fill_color='lavender',
               align='left'))
    ])
    plot_div = plot(fig,output_type='div',include_plotlyjs=True)
    plotDict={'plot_div':plot_div}
    return plotDict


def showtableActivity(df):
    fig = go.Figure(data=[go.Table(
    header=dict(values=list(["Activity ID","Name","Calories Burnt","Duration","Room Number"]),
                fill_color='paleturquoise',
                align='left'),
    cells=dict(values=[df['Activity ID'],df['Name'], df['Calories'],df['Duration'],df['Room Number']],
               fill_color='lavender',
               align='left'))
    ])
    plot_div = plot(fig,output_type='div',include_plotlyjs=True)
    plotDict={'plot_div':plot_div}
    return plotDict



def showtableEquipment(df):
    fig = go.Figure(data=[go.Table(
    header=dict(values=list(["Equipment ID","Name","Room Number","Weight","Brand"]),
                fill_color='paleturquoise',
                align='left'),
    cells=dict(values=[df['Equipment ID'],df['Name'], df['Room'],df['Weight'],df['Brand']],
               fill_color='lavender',
               align='left'))
    ])
    plot_div = plot(fig,output_type='div',include_plotlyjs=True)
    plotDict={'plot_div':plot_div}
    return plotDict


def showtableEquipmentCleaner(df):
    fig = go.Figure(data=[go.Table(
    header=dict(values=list(["EquipmentCleaner ID","Name","Phone","Role","Gym"]),
                fill_color='paleturquoise',
                align='left'),
    cells=dict(values=[df['EquipmentCleaner ID'],df['Name'], df['Phone'],df['Role'],df['Gym']],
               fill_color='lavender',
               align='left'))
    ])
    plot_div = plot(fig,output_type='div',include_plotlyjs=True)
    plotDict={'plot_div':plot_div}
    return plotDict

def updateTrainer(request):
    df = pd.DataFrame(columns = ['Trainer ID', 'Name','Gym','Number']) 
   
    if request.method == 'GET':
        for t in trainer.objects.raw('SELECT * FROM gym_trainer;'):
        
            
            df = df.append({'Trainer ID':t.id,'Name':t.trainer_name ,'Gym': t.gym.gym_name
            ,'Number':t.trainer_phone}, ignore_index=True)        
            plotlyDict=showtableTrainer(df)
        
            return render(request, "updateTrainer.html",plotlyDict)
    elif request.method == 'POST':
      
       
        if 'update' in request.POST:
            id=request.POST['id']
            name = request.POST['name']
            address = request.POST['Address']
            phno = request.POST['phno']
            hours = request.POST['hours']
            
        
            
            cursor = connection.cursor()
            #cursor.execute("UPDATE member SET m_name = %s, m_age = %s, m_phno = %s, m_hours = %s, m_salary = %s WHERE m_name == %s ;", [namei, age, phno, time, years, name])
            cursor.callproc("update_trainer", [id,name, address, phno, hours])
            return HttpResponseRedirect('/') 

    return render(request, "updateTrainer.html")




def updateEquipmentCleaner(request):
    df = pd.DataFrame(columns = ['EquipmentCleaner ID', 'Name','Phone','Role','Gym']) 
    if request.method == 'GET':
        for e in equipment_cleaner.objects.raw('SELECT * FROM gym_equipment_cleaner;'):
        
            
            df = df.append({'EquipmentCleaner ID':e.id,'Name':e.cleaner_name ,'Phone': e.cleaner_phone
            ,'Role':e.cleaner_role,'Gym':e.gym.gym_name}, ignore_index=True)        
        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
            plotlyDict=showtableEquipmentCleaner(df)
        
            return render(request, "updateEquipmentCleaner.html",plotlyDict)
    elif request.method == 'POST':
      
       
        if 'update' in request.POST:
            id=request.POST['id']
            name = request.POST['name']
            address = request.POST['address']
            phno = request.POST['phno']
            role = request.POST['role']
            
        
            
            cursor = connection.cursor()
            #cursor.execute("UPDATE member SET m_name = %s, m_age = %s, m_phno = %s, m_hours = %s, m_salary = %s WHERE m_name == %s ;", [namei, age, phno, time, years, name])
            cursor.callproc("update_equipment_cleaner", [id,name, address, phno, role])
            return HttpResponseRedirect('/') 

    return render(request, "updateEquipmentCleaner.html")


def updateMember(request):
    df = pd.DataFrame(columns = ['Member ID', 'Name','Gym','Number','Trainer']) 
   
    if request.method == 'GET':
        for m in member.objects.raw('SELECT * FROM gym_member;'):
        
            df = df.append({'Member ID':m.id,'Name':m.member_name ,'Number':m.member_phone, 
            'Gym':m.gym.gym_name,'Trainer':m.trainer.trainer_name}, ignore_index=True)        
        #df=getDataframeMember(membersAge,membersName,membersNumber)
        
        plotlyDict=showtableMember(df)
        return render(request, "updateMember.html",plotlyDict)
    elif request.method == 'POST':


        if 'update' in request.POST:
            id=request.POST['id']
            name = request.POST['name']
            dob = request.POST['dob']
            phno = request.POST['phno']
            weight = request.POST['Weight']
            height = request.POST['Height']  
        
            
            cursor = connection.cursor()
            #cursor.execute("UPDATE member SET m_name = %s, m_age = %s, m_phno = %s, m_hours = %s, m_salary = %s WHERE m_name == %s ;", [namei, age, phno, time, years, name])
            cursor.callproc("update_member", [id,name, dob, phno,  height,weight])
            return HttpResponseRedirect('/') 

        return render(request, "updateMember.html")

def load_trainers(request):
    gym_id = request.GET.get('gym')
    trainers = trainer.objects.filter(gym=gym_id)
    
    return render(request, 'trainer_dropdown.html', {'trainers':trainers })

def load_activities(request):
    
    members = request.GET.get('members')
    mem=member.objects.get(id=members)
    
    gym_id=member.objects.get(id=mem.id)
    gymMem=gym.objects.get(id=gym_id.gym.id)
    rooms=room.objects.filter(gym=gymMem.id)
    activities=activity.objects.filter(room=rooms[0].id)
    
   
    return render(request, 'activities_dropdown.html', {'activities':activities })


def load_trainer_activities(request):
    
    activities = request.GET.get('activity')
    act=activity.objects.get(id=activities)
    rooms=room.objects.get(id=act.room.id)
    gym_id=gym.objects.get(id=rooms.gym.id)
    trainers=trainer.objects.filter(gym=gym_id)
    
    return render(request, 'trainer_dropdown.html', {'trainers':trainers })


def load_equipment(request):
    cleaner = request.GET.get('cleaner')
    
    cleanerI=equipment_cleaner.objects.get(id=cleaner)
    
    gymId=gym.objects.get(id=int(cleanerI.gym.id))
    
    rooms=room.objects.filter(gym=int(gymId.id))
   
    equipments=equipment.objects.filter(room=rooms[0].id)
   
    return render(request, 'equipment_dropdown.html', {'equipments':equipments })           