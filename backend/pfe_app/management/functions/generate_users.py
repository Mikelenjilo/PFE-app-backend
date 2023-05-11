from datetime import datetime, timedelta
import random


regions = {
    'South-East Algeria': {'lat_range': (19.30761, 24.32125), 'lon_range': (7.532, 11.99872)},
    'Sahara region': {'lat_range': (22.64684, 31.6316), 'lon_range': (-7.621, 11.7487)},
    'North-East Algeria': {'lat_range': (34.33387, 36.98466), 'lon_range': (5.83333, 8.82256)},
    'North-Central Algeria': {'lat_range': (35.02261, 36.85661), 'lon_range': (2.07988, 5.50536)},
    'North-West Algeria': {'lat_range': (34.2089, 35.13814), 'lon_range': (-1.20544, 1.79107)}
}

def generateUsers(cursor):
    for i in range(500):
                first_name = ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=5))
                last_name = ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=5))
                date_of_birth = (datetime.now() - timedelta(days=random.randint(0, 15000))).strftime('%Y-%m-%d')
                email = f'{first_name}.{last_name}@example.com'
                password = 'password123'
                cronic_disease_1 = random.choice(['maladies rénales', 'cancer', 'diabète', 'maladies respiratoires', 'maladies cardiaques', None])
                cronic_disease_2 = random.choice(['maladies rénales', 'cancer', 'diabète', 'maladies respiratoires', 'maladies cardiaques', None])
                cronic_disease_3 = random.choice(['maladies rénales', 'cancer', 'diabète', 'maladies respiratoires', 'maladies cardiaques', None])
                cronic_disease_4 = random.choice(['maladies rénales', 'cancer', 'diabète', 'maladies respiratoires', 'maladies cardiaques', None])
                cronic_disease_5 = random.choice(['maladies rénales', 'cancer', 'diabète', 'maladies respiratoires', 'maladies cardiaques', None])

                gender = random.choice(['Homme', 'Femme'])

                region = random.choices(list(regions.keys()), weights=[5, 2, 20, 15, 8], k=1)[0]

                latitude = random.uniform(*regions[region]['lat_range'])
                longitude = random.uniform(*regions[region]['lon_range'])

                cluster_id = None

                if_transmit = random.choice([True, False])

                if if_transmit:
                    date_of_contamination = (datetime.now() - timedelta(days=random.randint(0, 6))).strftime('%Y-%m-%d')
                else:
                    date_of_contamination = None

                cursor.execute('''INSERT INTO pfe_app_user (first_name, last_name, date_of_birth, email, password, cronic_disease_1, cronic_disease_2, cronic_disease_3, cronic_disease_4, cronic_disease_5, gender, latitude, longitude, cluster_id_id, if_transmit, date_of_contamination)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);''', (first_name, last_name, date_of_birth, email, password, cronic_disease_1, cronic_disease_2, cronic_disease_3, cronic_disease_4, cronic_disease_5, gender, latitude, longitude, cluster_id, if_transmit, date_of_contamination))