from django.db import models
from django.contrib.auth.models import User

class UserToken(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    access_token = models.CharField(max_length=255)
    expires_in = models.CharField(max_length=255)
    refresh_token = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    scope = models.CharField(max_length=255)