import 'package:dartz/dartz.dart';
import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/core/errors/exceptions.dart';
import 'package:projet_de_fin_d_etude/core/errors/failure.dart';
import 'package:projet_de_fin_d_etude/core/models/user_model.dart';
import 'package:projet_de_fin_d_etude/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:projet_de_fin_d_etude/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, bool>> isSignedIn(String email) async {
    final result = await localDataSource.isSignedIn(email);
    try {
      return Right(result);
    } on LocalDatabaseException catch (failure) {
      return Left(LocalDatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> registerInWithEmailAndPassword(
      String email, String password) async {
    try {
      return Right(await localDataSource.registerInWithEmailAndPassword(
          email, password));
    } on LocalDatabaseException catch (failure) {
      return Left(LocalDatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return Right(
          await localDataSource.signInWithEmailAndPassword(email, password));
    } on LocalDatabaseException catch (failure) {
      return Left(LocalDatabaseFailure(failure.message));
    }
  }

  @override
  Either<Failure, void> signOut(User user) {
    try {
      return Right(localDataSource.signOut(user));
    } on LocalDatabaseException catch (failure) {
      return Left(LocalDatabaseFailure(failure.message));
    }
  }

  // TODO: review
  @override
  Future<Either<Failure, bool>> isEmailExists(String email) async {
    final result = await localDataSource.isEmailExists(email);
    try {
      return Right(result);
    } on LocalDatabaseException catch (failure) {
      return Left(LocalDatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserByEmail(String email) async {
    final result = await localDataSource.getUserByEmail(email);

    try {
      return Right(result);
    } on LocalDatabaseException catch (failure) {
      return Left(LocalDatabaseFailure(failure.message));
    }
  }
}
