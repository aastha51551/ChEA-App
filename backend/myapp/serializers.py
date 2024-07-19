from rest_framework import serializers
from .models import Opportunity

class OpportunitiesSerializer(serializers.ModelSerializer):
    isFavourite = serializers.SerializerMethodField()
    class Meta:
        model = Opportunity
        fields = '__all__'
    def get_isFavourite(self,obj):
        if self.context.get('always_favourite'):
            return True
        
        return obj.isFavourite