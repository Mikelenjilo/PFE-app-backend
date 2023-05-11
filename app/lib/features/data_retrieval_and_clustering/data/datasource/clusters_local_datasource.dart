import 'dart:math';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:projet_de_fin_d_etude/core/services/sql_helper.dart';
import 'package:projet_de_fin_d_etude/core/utils/constants.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/cluster.dart';

abstract class ClusterLocalDataSource {
  Future<List<ClusterModel>> groupUsersByLocation(List<User> users);
  Future<void> assignClustersToUsers(
      List<ClusterModel> clusters, List<User> users);
  void assignColorsToClusters(List<ClusterModel> clusters);
  void calculateTauxDePropagation(List<Cluster> clusters);
  void calculateClusterRayon(List<Cluster> clusters);
  Future<void> commitClusterChangesToDatabase(List<Cluster> clusters);
}

class ClustersLocalDataSourceImpl implements ClusterLocalDataSource {
  @override
  Future<List<ClusterModel>> groupUsersByLocation(List<User> users) async {
    final Random random = Random();

    if (users.isEmpty) {
      throw Exception('Users list is empty!');
    }

    final List<LatLng> centroids = [
      LatLng(users[random.nextInt(users.length)].latitude,
          users[random.nextInt(users.length)].longitude)
    ];

    while (centroids.length < AppConstants.clusterNumber) {
      final List<double> distances = [];
      for (final user in users) {
        final distancesToCentroids = centroids
            .map((c) => const Distance().as(
                LengthUnit.Kilometer, c, LatLng(user.latitude, user.longitude)))
            .toList();
        distances.add(distancesToCentroids.reduce(min));
      }
      final totalDistance = distances.reduce((a, b) => a + b);
      final normalizedDistances =
          distances.map((d) => d / totalDistance).toList();
      final randomValue = random.nextDouble();
      double sum = 0;
      int index = -1;
      while (sum < randomValue) {
        index++;
        sum += normalizedDistances[index];
      }
      centroids.add(LatLng(users[index].latitude, users[index].longitude));
    }

    while (true) {
      final List<ClusterModel> clustersK = List.generate(
          AppConstants.clusterNumber,
          (index) => ClusterModel(
                id: index + 1,
                users: [],
                centroidPosition: centroids[index],
              ));

      for (final user in users) {
        final distances = centroids
            .map((c) => const Distance().as(
                LengthUnit.Kilometer, c, LatLng(user.latitude, user.longitude)))
            .toList();
        final nearestCentroid = distances.indexOf(distances.reduce(min));
        clustersK[nearestCentroid].users.add(user);
      }

      final newCentroids = clustersK
          .map((c) => c.users
              .map((u) => LatLng(u.latitude, u.longitude))
              .reduce((a, b) => LatLng((a.latitude + b.latitude) / 2,
                  (a.longitude + b.longitude) / 2)))
          .toList();

      if (newCentroids.every((c) => centroids.contains(c))) {
        for (ClusterModel clusterK in clustersK) {
          clusterK.numberOfPersons = clusterK.users.length;
          clusterK.numberOfSickPersons =
              clusterK.users.where((element) => element.siInfecte == 1).length;
        }

        await assignClustersToUsers(clustersK, users);
        return clustersK;
      }

      centroids.setAll(0, newCentroids);
    }
  }

  @override
  Future<void> assignClustersToUsers(
      List<ClusterModel> clusters, List<User> users) async {
    for (final user in users) {
      for (final cluster in clusters) {
        if (cluster.users.contains(user)) {
          user.clusterId = cluster.id;
          break;
        }
      }
    }
    for (final cluster in clusters) {
      cluster.users =
          users.where((user) => user.clusterId == cluster.id).toList();
    }
  }

  @override
  void assignColorsToClusters(List<ClusterModel> clusters) {
    Set<Color> usedColors = {};

    for (int i = 0; i < clusters.length; i++) {
      int randomNumber = Random().nextInt(AppConstants.colors.length);

      while (usedColors.contains(AppConstants.colors[randomNumber])) {
        randomNumber = Random().nextInt(AppConstants.colors.length);
      }

      clusters[i].color = AppConstants.colors[randomNumber];
      usedColors.add(AppConstants.colors[randomNumber]);
    }
  }

  @override
  void calculateTauxDePropagation(List<Cluster> clusters) {
    List<double> tauxDePropagationList = [];
    for (var cluster in clusters) {
      final double surface = 2 * pi * pow(cluster.rayon, 2);

      cluster.tauxDePropagation =
          ((cluster.numberOfSickPersons / cluster.numberOfPersons) *
              (1 / surface));

      tauxDePropagationList.add(cluster.tauxDePropagation);
    }

    double tauxDePropagationMax =
        tauxDePropagationList.reduce((a, b) => a > b ? a : b);

    for (var cluster in clusters) {
      cluster.tauxDePropagation = double.parse(
          (cluster.tauxDePropagation / tauxDePropagationMax)
              .toStringAsFixed(2));
    }
  }

  @override
  void calculateClusterRayon(List<Cluster> clusters) {
    for (var cluster in clusters) {
      final centroid = cluster.centroidPosition;

      final distances = cluster.users.map((user) {
        final point = LatLng(user.latitude, user.longitude);
        return const Distance().as(LengthUnit.Kilometer, centroid!, point);
      }).toList();

      final totalDistances = distances.reduce((a, b) => a + b);
      cluster.rayon = totalDistances / cluster.users.length;
    }
  }

  @override
  Future<void> commitClusterChangesToDatabase(List<Cluster> clusters) async {
    await LocalDatabaseHelper.commitClusterChangesToDatabase(clusters);
  }
}
