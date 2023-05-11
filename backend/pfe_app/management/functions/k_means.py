import numpy as np
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt


def kmeans(cursor):
    cursor.execute('SELECT longitude, latitude FROM pfe_app_user')
    data = np.array(cursor.fetchall())

    kmeans = KMeans(n_clusters=5, init='k-means++', random_state=0).fit(data)
    labels = kmeans.labels_

    colors = ['red', 'blue', 'green', 'cyan', 'orange', 'purple', 'pink', 'yellow']
    for i in range(5):
        plt.scatter(data[labels==i,0], data[labels==i,1], s=10, c=colors[i], alpha=0.5)

    plt.show()
    
    # TODO: add each user's cluster_id to the database
    cursor.execute('SELECT user_id, latitude, longitude FROM pfe_app_user')
    users = cursor.fetchall()

    for i, user in enumerate(users):
        cluster_id = pred_y[i]
        cursor.execute('UPDATE pfe_app_user SET cluster_id = ? WHERE user_id = ?', (cluster_id, user[0]))
