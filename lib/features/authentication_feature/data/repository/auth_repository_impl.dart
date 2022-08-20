import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/features/authentication_feature/data/data_source/authentication_remote_data_source.dart';
import 'package:sample_app/features/authentication_feature/data/model/registration_response.dart';
import 'package:sample_app/features/authentication_feature/domain/repository/auth_repository.dart';

import '../model/login_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authRemoteDatasource);
  AuthRemoteDatasource authRemoteDatasource;

  @override
  Future<Either<Failure, LoginResponse>> login(
      {required String email, required String password}) async {
    try {
     return authRemoteDatasource
          .login(email: email, password: password)
          .then((value) {
        return Right(value);
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RegistrationResponse>> signUp(
      {required String email, required String password}) async {
    try {
      return authRemoteDatasource
          .signUp(email: email, password: password)
          .then((value) {
        return Right(value);
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
