# Generated by Django 5.0.6 on 2024-07-15 00:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='opportunity',
            name='OpportunityType',
            field=models.CharField(choices=[('Internship', 'Internship'), ('Placement', 'Placement'), ('Projects', 'Projects')], default='Internship', max_length=100),
        ),
    ]