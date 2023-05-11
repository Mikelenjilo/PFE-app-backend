import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/cluster.dart';

abstract class ClusterRepository {
  Future<List<ClusterModel>> groupUsersByLocation(List<User> users);
  Future<void> assignClustersToUsers(
      List<ClusterModel> clusters, List<User> users);
  void assignColorsToClusters(List<ClusterModel> clusters);
  void calculateTauxDePropagation(List<Cluster> clusters);
  void calculateClusterRayon(List<Cluster> clusters);
  Future<void> commitClusterChangesToDatabase(List<Cluster> clusters);
}
