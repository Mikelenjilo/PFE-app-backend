import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/core/services/sql_helper.dart';
import 'package:projet_de_fin_d_etude/core/models/user_model.dart';

abstract class UsersLocalDataSource {
  Future<List<UserModel>> formatUsers(List<Map<String, Object?>> usersMap);
  Future<void> updateSickUsers(List<User> sickUsers);
  Future<void> commitUserChangesToDatabase(List<User> users);
  Future<List<User>> getSickUsers();
}

class UsersLocalDataSourceImpl implements UsersLocalDataSource {
  @override
  Future<List<UserModel>> formatUsers(
      List<Map<String, dynamic>> usersMap) async {
    final List<UserModel> users = [];

    for (var userMap in usersMap) {
      users.add(UserModel.fromMap(userMap));
    }

    return users;
  }

  @override
  Future<void> updateSickUsers(List<User> users) async {
    await LocalDatabaseHelper.updateSickUsers(users);
  }

  @override
  Future<void> commitUserChangesToDatabase(List<User> users) async {
    await LocalDatabaseHelper.commitUserChangesToDatabase(users);
  }

  @override
  Future<List<User>> getSickUsers() async {
    final usersMap = await LocalDatabaseHelper.getSickUsers();
    final List<User> users = await formatUsers(usersMap);

    return users;
  }
}
