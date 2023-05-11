import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/core/errors/exceptions.dart';
import 'package:projet_de_fin_d_etude/core/models/user_model.dart';
import 'package:projet_de_fin_d_etude/core/services/sql_helper.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/datasource/users_local_datasource.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/repositories/user_repository_impl.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/usecases/format_users.dart';

abstract class AuthLocalDataSource {
  Future<void> registerInWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  void signOut(User user);
  Future<bool> isSignedIn(String email);
  Future<bool> isEmailExists(String email);
  Future<UserModel> getUserByEmail(String email);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<bool> isSignedIn(String email) async {
    if (!await isEmailExists(email)) {
      throw LocalDatabaseException('No user found with email $email');
    }
    final List<Map<String, dynamic>> usersMap =
        await LocalDatabaseHelper.getUsers();
    final List<UserModel> users =
        await UsersLocalDataSourceImpl().formatUsers(usersMap);

    for (var user in users) {
      if (user.email == email) {
        return user.online;
      }
    }

    throw LocalDatabaseException('No user found with email $email');
  }

  @override
  Future<void> registerInWithEmailAndPassword(
      String email, String password) async {
    if (!await isEmailExists(email)) {
      await LocalDatabaseHelper.registerNewUser(email, password);
    } else {
      throw const LocalDatabaseException('Email already exists');
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    if (await isEmailExists(email)) {
      final List<Map<String, Object?>> result =
          await LocalDatabaseHelper.getUserByEmailAndPassword(email, password);

      if (result.isEmpty) {
        throw const LocalDatabaseException('Wrong password');
      } else {
        final Object? id = result.first['id_utilisateur'];
        final List<Map<String, dynamic>> usersMap =
            await LocalDatabaseHelper.getUsers();
        final List<User> users =
            await FormatUsers(UserRepositoryImpl(UsersLocalDataSourceImpl()))
                .run(usersMap);

        final User user = users.firstWhere((element) => element.id == id);
        user.online = true;
      }
    } else {
      throw const LocalDatabaseException('Email does not exist');
    }
  }

  @override
  void signOut(User user) {
    if (user.online) {
      user.online = false;
    } else {
      throw const LocalDatabaseException('User is not online');
    }
  }

  @override
  Future<UserModel> getUserByEmail(String email) async {
    if (await isEmailExists(email)) {
      final result = await LocalDatabaseHelper.getUserByEmail(email);

      return UserModel.fromMap(result.first);
    } else {
      throw const LocalDatabaseException('No user found with this email');
    }
  }

  @override
  Future<bool> isEmailExists(String email) async {
    final result = await LocalDatabaseHelper.getUserByEmail(email);

    return result.isNotEmpty;
  }
}
