import numpy as np
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt


def elbow_method(cursor):
    cursor.execute('SELECT latitude, longitude FROM pfe_app_user')
    data = np.array(cursor.fetchall())

    # normalize the data
    data = (data - np.mean(data, axis=0)) / np.std(data, axis=0)

    # determine the optimal number of clusters using the elbow method
    distortions = []
    for i in range(1, 11):
        kmeans = KMeans(n_clusters=i, init='k-means++', max_iter=300, n_init=10, random_state=0)
        kmeans.fit(data)
        distortions.append(kmeans.inertia_)
    plt.plot(range(1, 11), distortions)
    plt.title('Elbow Method')
    plt.xlabel('Number of Clusters')
    plt.ylabel('Distortion')
    plt.show()
    
