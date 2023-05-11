from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import viewsets

from .models import User, Cluster
from .serializers import UserSerializer, ClusterSerializer


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class ClusterViewSet(viewsets.ModelViewSet):
    queryset = Cluster.objects.all()
    serializer_class = ClusterSerializer