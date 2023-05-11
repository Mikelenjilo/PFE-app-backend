import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/user_repository.dart';

class GetSickUsers {
  final UserRepository userRepository;

  const GetSickUsers(this.userRepository);

  Future<List<User>> run() async {
    return await userRepository.getSickUsers();
  }
}
