from django.urls import path, include
from rest_framework import routers
from .views import UserViewSet, ClusterViewSet

router = routers.DefaultRouter()
router.register(r'users', UserViewSet, basename='users')
router.register(r'clusters', ClusterViewSet, basename='clusters')


urlpatterns = [
    path('', include(router.urls)),
]

