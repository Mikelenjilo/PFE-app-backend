import random
from datetime import datetime, timedelta

from django.core.management.base import BaseCommand
from django.db import connection

from pfe_app.management.functions.remove_users import removeUsers



class Command(BaseCommand):
    help = 'Remove all users'

    def handle(self, *args, **options):
        with connection.cursor() as cursor:
            removeUsers(cursor)