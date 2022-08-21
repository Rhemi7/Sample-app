import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/features/authentication_feature/data/model/registration_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/user_data.dart';

import '../../data/model/login_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegistrationResponse>> signUp({required String email, required String password, required String firstName, required String lastName});

  Future<Either<Failure, LoginResponse>> login({required String email, required String password});

  Future<Either<Failure, UserData>> getUser();


}