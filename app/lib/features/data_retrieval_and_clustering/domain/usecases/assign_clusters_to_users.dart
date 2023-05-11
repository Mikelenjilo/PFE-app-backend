import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/cluster_repository.dart';

class AssignClustersToUsers {
  final ClusterRepository repository;

  AssignClustersToUsers(this.repository);

  Future<void> run(List<ClusterModel> clusters, List<User> users) async {
    await repository.assignClustersToUsers(clusters, users);
  }
}
