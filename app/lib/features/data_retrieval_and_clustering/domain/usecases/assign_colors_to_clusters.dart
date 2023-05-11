import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/cluster_repository.dart';

class AssignColorsToClusters {
  final ClusterRepository repository;

  AssignColorsToClusters(this.repository);

  void run(List<ClusterModel> clusters) {
    return repository.assignColorsToClusters(clusters);
  }
}
