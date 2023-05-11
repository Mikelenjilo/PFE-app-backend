import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/user_repository.dart';

class FormatUsers {
  final UserRepository repository;

  FormatUsers(this.repository);

  Future<List<User>> run(List<Map<String, Object?>> usersMap) async {
    return await repository.formatUsers(usersMap);
  }
}
