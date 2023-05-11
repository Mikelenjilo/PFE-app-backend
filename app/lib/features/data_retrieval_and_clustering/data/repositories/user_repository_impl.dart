import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/datasource/users_local_datasource.dart';
import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UsersLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<List<User>> formatUsers(List<Map<String, Object?>> usersMap) async {
    return await localDataSource.formatUsers(usersMap);
  }

  @override
  Future<void> updateSickUsers(List<User> sickUsers) async {
    return await localDataSource.updateSickUsers(sickUsers);
  }

  @override
  Future<void> commitUserChangesToDatabase(List<User> users) async {
    await localDataSource.commitUserChangesToDatabase(users);
  }

  @override
  Future<List<User>> getSickUsers() {
    return localDataSource.getSickUsers();
  }
}
