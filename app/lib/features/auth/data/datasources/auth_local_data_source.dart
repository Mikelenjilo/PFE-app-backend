import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/core/errors/exceptions.dart';
import 'package:projet_de_fin_d_etude/features/auth/data/models/user_model.dart';
import 'package:projet_de_fin_d_etude/core/services/sql_helper.dart';

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
  Future<bool> isSignedIn(String email) async {}

  @override
  Future<void> registerInWithEmailAndPassword(
      String email, String password) async {}

  @override
  Future<void> signInWithEmailAndPassword(
      String email, String password) async {}

  @override
  void signOut(User user) {}

  @override
  Future<UserModel> getUserByEmail(String email) async {}

  @override
  Future<bool> isEmailExists(String email) async {}
}
