from django.db import models

# Create your models here.
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    email = models.EmailField(max_length=254)
    password = models.CharField(max_length=50)
    cronic_disease_1 = models.CharField(max_length=50, null=True)
    cronic_disease_2 = models.CharField(max_length=50, null=True)
    cronic_disease_3 = models.CharField(max_length=50, null=True)
    cronic_disease_4 = models.CharField(max_length=50, null=True)
    cronic_disease_5 = models.CharField(max_length=50, null=True)
    gender = models.CharField(max_length=50)
    latitude = models.FloatField()
    longitude = models.FloatField()
    cluster_id = models.ForeignKey('Cluster', on_delete=models.CASCADE, null=True)
    if_transmit = models.BooleanField()
    date_of_contamination = models.DateField(null=True)

class Cluster(models.Model):
    cluster_id = models.AutoField(primary_key=True)
    number_of_users = models.IntegerField()
    number_of_sick_users = models.IntegerField()
    centroid_latitude = models.FloatField()
    centroid_longitude = models.FloatField()
    color = models.CharField(max_length=50)
    radius = models.FloatField()
    spread_rate = models.FloatField()