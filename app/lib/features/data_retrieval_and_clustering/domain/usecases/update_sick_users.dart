import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/user_repository.dart';

class UpdateSickUsers {
  final UserRepository repository;

  UpdateSickUsers(this.repository);

  Future<void> run(List<User> sickUsers) async {
    return await repository.updateSickUsers(sickUsers);
  }
}
