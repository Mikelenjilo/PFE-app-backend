import 'package:projet_de_fin_d_etude/core/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> formatUsers(List<Map<String, Object?>> usersMap);
  Future<void> updateSickUsers(List<User> sickUsers);
  Future<void> commitUserChangesToDatabase(List<User> users);
  Future<List<User>> getSickUsers();
}
