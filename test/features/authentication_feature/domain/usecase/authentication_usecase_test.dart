
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_app/features/authentication_feature/data/model/login_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/registration_response.dart';
import 'package:sample_app/features/authentication_feature/domain/repository/auth_repository.dart';
import 'package:sample_app/features/authentication_feature/domain/usecase/authentication_usecase.dart';

class MockAuthenticationRepository extends Mock implements AuthRepository {}

void main() {
  AuthRepository repository;
  Login loginUsecase;
  Register registerUsecase;

  String email = "abc@xyz.com";
  String password = "password";
  String firstName = "John";
  String lastName = "Doe";

  final testLoginModel = LoginResponse(
      localId: "ZY1rJK0eYLg...",
      email: "[user@example.com]",
      displayName: "",
      idToken: "[ID_TOKEN]",
      registered: true,
      refreshToken: "[REFRESH_TOKEN]",
      expiresIn: "3600"
  );

  final testRegistrationModel = RegistrationResponse(
      localId: "ZY1rJK0eYLg...",
      email: "[user@example.com]",
      idToken: "[ID_TOKEN]",
      refreshToken: "[REFRESH_TOKEN]",
      expiresIn: "3600"
  );

  group("Login usecase", () {
    test(
      'should get login response from the repository',
          () async {
        repository = MockAuthenticationRepository();
        loginUsecase = Login(repository);
        //stub the method
        when(repository.login(email: email, password: password)).thenAnswer((_) async => Right(testLoginModel));
        // act
        final result = await loginUsecase(UserParams(email: email, password: password));
        // assert
        expect(result, Right(testLoginModel));
        verify(repository.login(email: email, password: password));
        verifyNoMoreInteractions(repository);
      },
    );
  });

  group("Registration usecase", () {
    test(
      'should get registration response from the repository',
          () async {
        repository = MockAuthenticationRepository();
        registerUsecase = Register(repository);
        //stub the method
        when(repository.signUp(email: email, password: password, firstName: firstName, lastName: lastName)).thenAnswer((_) async => Right(testRegistrationModel));
        // act
        final result = await registerUsecase(UserParams(email: email, password: password, firstName: firstName, lastName: lastName));
        // assert
        expect(result, Right(testRegistrationModel));
        verify(repository.signUp(email: email, password: password, firstName: firstName, lastName: lastName));
        verifyNoMoreInteractions(repository);
      },
    );
  });
}