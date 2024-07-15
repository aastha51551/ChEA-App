from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Opportunity
from .serializers import OpportunitiesSerializer
from rest_framework import status

@api_view(['GET'])
def get_opportunities(request):
    opportunities = Opportunity.objects.all()
    serializer = OpportunitiesSerializer(opportunities,many=True)
    return Response(serializer.data,status=status.HTTP_200_OK)

