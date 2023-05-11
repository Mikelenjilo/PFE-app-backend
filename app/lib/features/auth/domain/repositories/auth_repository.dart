import 'package:dartz/dartz.dart';
import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/core/errors/failure.dart';
import 'package:projet_de_fin_d_etude/core/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> getUserByEmail(String email);
  Future<Either<Failure, bool>> isEmailExists(String email);
  Future<Either<Failure, bool>> isSignedIn(String email);
  Future<Either<Failure, void>> registerInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      String email, String password);
  Either<Failure, void> signOut(User user);
}
