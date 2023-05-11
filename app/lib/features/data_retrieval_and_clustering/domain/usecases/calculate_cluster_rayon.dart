import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/cluster.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/cluster_repository.dart';

class CalculateClusterRayon {
  final ClusterRepository repository;

  CalculateClusterRayon(this.repository);

  void run(List<Cluster> clusters) {
    repository.calculateClusterRayon(clusters);
  }
}
