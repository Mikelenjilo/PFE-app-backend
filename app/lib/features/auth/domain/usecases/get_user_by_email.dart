import 'package:dartz/dartz.dart';
import 'package:projet_de_fin_d_etude/core/errors/failure.dart';
import 'package:projet_de_fin_d_etude/core/models/user_model.dart';
import 'package:projet_de_fin_d_etude/features/auth/domain/repositories/auth_repository.dart';

class GetUserByEmail {
  final AuthRepository repository;

  GetUserByEmail(this.repository);

  Future<Either<Failure, UserModel>> run(String email) async {
    return await repository.getUserByEmail(email);
  }
}
