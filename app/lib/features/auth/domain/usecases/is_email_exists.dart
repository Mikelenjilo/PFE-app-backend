import 'package:dartz/dartz.dart';
import 'package:projet_de_fin_d_etude/core/errors/failure.dart';
import 'package:projet_de_fin_d_etude/features/auth/domain/repositories/auth_repository.dart';

class IsEmailExists {
  final AuthRepository repository;

  IsEmailExists(this.repository);

  Future<Either<Failure, bool>> run(String email) async {
    return await repository.isEmailExists(email);
  }
}
