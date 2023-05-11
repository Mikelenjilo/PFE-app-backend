import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/user_repository.dart';

class CommitUserChangesToDatabase {
  final UserRepository repository;

  CommitUserChangesToDatabase(this.repository);

  Future<void> run(List<User> users) async {
    await repository.commitUserChangesToDatabase(users);
  }
}
