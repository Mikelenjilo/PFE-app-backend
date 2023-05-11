import 'package:dartz/dartz.dart';
import 'package:projet_de_fin_d_etude/core/errors/failure.dart';
import 'package:projet_de_fin_d_etude/features/auth/domain/repositories/auth_repository.dart';

class IsSignedIn {
  final AuthRepository repository;

  IsSignedIn(this.repository);

  Future<Either<Failure, bool>> run(String email) async {
    return await repository.isSignedIn(email);
  }
}
