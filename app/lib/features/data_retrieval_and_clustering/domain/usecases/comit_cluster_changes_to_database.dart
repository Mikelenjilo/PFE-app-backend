import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/cluster.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/cluster_repository.dart';

class CommitClusterChangesToDatabase {
  final ClusterRepository repository;

  CommitClusterChangesToDatabase(this.repository);

  Future<void> run(List<Cluster> clusters) async {
    await repository.commitClusterChangesToDatabase(clusters);
  }
}
