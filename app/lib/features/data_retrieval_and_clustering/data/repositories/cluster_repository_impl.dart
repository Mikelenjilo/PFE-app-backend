import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/datasource/clusters_local_datasource.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/cluster.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/cluster_repository.dart';

class ClusterRepositoryImpl implements ClusterRepository {
  final ClusterLocalDataSource localDataSource;

  ClusterRepositoryImpl(this.localDataSource);

  @override
  Future<List<ClusterModel>> groupUsersByLocation(List<User> users) async {
    return await localDataSource.groupUsersByLocation(users);
  }

  @override
  Future<void> assignClustersToUsers(
      List<ClusterModel> clusters, List<User> users) async {
    await localDataSource.assignClustersToUsers(clusters, users);
  }

  @override
  void assignColorsToClusters(List<ClusterModel> clusters) {
    localDataSource.assignColorsToClusters(clusters);
  }

  @override
  void calculateTauxDePropagation(List<Cluster> clusters) async {
    localDataSource.calculateTauxDePropagation(clusters);
  }

  @override
  void calculateClusterRayon(List<Cluster> clusters) {
    localDataSource.calculateClusterRayon(clusters);
  }

  @override
  Future<void> commitClusterChangesToDatabase(List<Cluster> clusters) async {
    await localDataSource.commitClusterChangesToDatabase(clusters);
  }
}
