import 'dart:io';

import 'package:bus_application/core/error/failure.dart';
import 'package:bus_application/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_local_datasource/remote_data_source/auth_remote_datasource.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, void>> registercustomer(AuthEntity student) async {
    try {
      await _authRemoteDataSource.registercustomer(student);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> logincustomer(
      String username, String password) async {
    try {
      final token =
          await _authRemoteDataSource.logincustomer(username, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _authRemoteDataSource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
