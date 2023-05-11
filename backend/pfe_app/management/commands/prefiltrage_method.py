from django.core.management.base import BaseCommand
from django.db import connection

from pfe_app.management.functions.prefiltrage_method import prefiltrageMethod


class Command(BaseCommand):
    help = 'Generates random data for the utilisateurs and utilisateurs_malade tables'

    def handle(self, *args, **options):
        with connection.cursor() as cursor:
            prefiltrageMethod(cursor)
            

