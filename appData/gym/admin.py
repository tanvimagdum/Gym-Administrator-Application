from django.contrib import admin

# Register your models here.
from gym.models import member, equipment, equipment_cleaner, room, activity, trainer, gym

admin.site.register(member)
admin.site.register(equipment)
admin.site.register(equipment_cleaner)
admin.site.register(room)
admin.site.register(trainer)
admin.site.register(activity)
admin.site.register(gym)
