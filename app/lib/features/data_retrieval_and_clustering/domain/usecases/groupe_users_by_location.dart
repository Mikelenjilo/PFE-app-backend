import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/cluster_repository.dart';

class GroupUsersByLocation {
  final ClusterRepository repository;

  GroupUsersByLocation(this.repository);

  Future<List<ClusterModel>> run(List<User> users) async {
    return await repository.groupUsersByLocation(users);
  }
}
