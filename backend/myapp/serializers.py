from rest_framework import serializers
from .models import Opportunity

class OpportunitiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Opportunity
        fields = '__all__'