import 'package:projet_de_fin_d_etude/features/auth/domain/entities/user.dart';
import 'package:dio/dio.dart';

abstract class AuthLocalDataSource {
  Future<void> registerInWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  void signOut(User user);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final dio = Dio();
  @override
  Future<void> registerInWithEmailAndPassword(
      String email, String password) async {
    final response = await dio.get('http://192.168.1.42:8000/users');
    print(response);
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  void signOut(User user) {
    // TODO: implement signOut
  }
}

void main() {
  AuthLocalDataSourceImpl().registerInWithEmailAndPassword('email', 'password');
}
