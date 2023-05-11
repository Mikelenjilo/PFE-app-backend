import 'package:dartz/dartz.dart';
import 'package:projet_de_fin_d_etude/core/errors/failure.dart';
import 'package:projet_de_fin_d_etude/features/auth/domain/repositories/auth_repository.dart';

class RegisterInWithEmailAndPassword {
  final AuthRepository repository;

  RegisterInWithEmailAndPassword(this.repository);

  Future<Either<Failure, void>> run(String email, String password) async {
    return await repository.registerInWithEmailAndPassword(email, password);
  }
}
