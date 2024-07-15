from django.db import models

class Opportunity(models.Model):
    title = models.CharField(max_length=255)
    stipend = models.CharField(max_length=100)
    location = models.CharField(max_length=255)
    lastDateOfApply = models.DateField()
    domain = models.CharField(max_length=100)
    role = models.CharField(max_length=100)
    description = models.TextField()
    OpportunityType = models.CharField(max_length=100,choices=[('Internship','Internship'),('Placement','Placement'),('Projects','Projects')],default='Internship')

    def __str__(self):
        return self.title


# Create your models here.
