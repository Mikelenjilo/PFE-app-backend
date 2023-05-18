import 'package:dartz/dartz.dart';
import 'package:projet_de_fin_d_etude/core/errors/failure.dart';
import 'package:projet_de_fin_d_etude/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> registerInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      String email, String password);
  Either<Failure, void> signOut(User user);
}
