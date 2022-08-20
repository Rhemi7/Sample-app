import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/core/usecases/usecases.dart';
import 'package:sample_app/features/authentication_feature/data/model/login_response.dart';
import 'package:sample_app/features/authentication_feature/domain/repository/auth_repository.dart';

import '../../data/model/registration_response.dart';

class Login extends UseCase<LoginResponse, UserParams> {
  AuthRepository authRepository;
  Login(this.authRepository);

  @override
  Future<Either<Failure, LoginResponse>> call(UserParams params) async {
    return await authRepository.login(email: params.email, password: params.password);
  }
}

class Register extends UseCase<RegistrationResponse, UserParams> {
  AuthRepository authRepository;
  Register(this.authRepository);

  @override
  Future<Either<Failure, RegistrationResponse>> call(UserParams params) async {
    return await authRepository.signUp(email: params.email, password: params.password);
  }
}

class UserParams extends Equatable {
  final String email;
  final String password;

  const UserParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}