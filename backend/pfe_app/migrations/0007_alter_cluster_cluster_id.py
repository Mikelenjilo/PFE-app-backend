# Generated by Django 4.2.1 on 2023-05-12 15:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pfe_app', '0006_alter_cluster_spread_rate_alter_user_email_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cluster',
            name='cluster_id',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
    ]
