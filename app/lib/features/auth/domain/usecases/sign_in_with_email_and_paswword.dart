import 'package:dartz/dartz.dart';
import 'package:projet_de_fin_d_etude/core/errors/failure.dart';
import 'package:projet_de_fin_d_etude/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmailAndPassword {
  final AuthRepository repository;

  SignInWithEmailAndPassword(this.repository);

  Future<Either<Failure, void>> run(String email, String password) async {
    return await repository.signInWithEmailAndPassword(email, password);
  }
}
