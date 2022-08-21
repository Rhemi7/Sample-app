
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/features/authentication_feature/data/data_source/authentication_remote_data_source.dart';
import 'package:sample_app/features/authentication_feature/data/model/login_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/registration_response.dart';
import 'package:sample_app/features/authentication_feature/data/repository/auth_repository_impl.dart';


class MockAuthRemoteDataSource extends Mock
    implements AuthRemoteDatasource {}

void main() {
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late AuthRepositoryImpl repository;

  mockRemoteDataSource = MockAuthRemoteDataSource();
  repository = AuthRepositoryImpl(
       mockRemoteDataSource);


  group('login', () {
    String email = "abc@xyz.com";
    String password = "password";

    final testLoginModel = LoginResponse(
        localId: "ZY1rJK0eYLg...",
        email: "[user@example.com]",
        displayName: "",
        idToken: "[ID_TOKEN]",
        registered: true,
        refreshToken: "[REFRESH_TOKEN]",
        expiresIn: "3600"
    );

      test(
        'should return remote data when the call is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.login(email: email, password: password))
              .thenAnswer((_) async => testLoginModel);
          // act
          final result = await repository.login(email: email, password: password);
          // assert
          verify(mockRemoteDataSource.login(email: email, password: password));

          expect(result, equals(Right(testLoginModel)));
        },
      );

    test(
      'should return server failure when the call is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.login(email: email, password: password))
            .thenThrow(ServerException());
        // act
        final result = await repository.login(email: email, password: password);
        // assert
        verify(mockRemoteDataSource.login(email: email, password: password));
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });

  group('Register', () {
    String email = "abc@xyz.com";
    String password = "password";
    String firstName = "John";
    String lastName = "Doe";

    final testRegistrationModel = RegistrationResponse(
        localId: "ZY1rJK0eYLg...",
        email: "[user@example.com]",
        idToken: "[ID_TOKEN]",
        refreshToken: "[REFRESH_TOKEN]",
        expiresIn: "3600"
    );

    test(
      'should return remote data when the call is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.signUp(email: email, password: password, firstName: firstName, lastName: lastName,))
            .thenAnswer((_) async => testRegistrationModel);
        // act
        final result = await repository.signUp(email: email, password: password, firstName: firstName, lastName: lastName);
        // assert
        verify(mockRemoteDataSource.signUp(email: email, password: password, firstName: firstName, lastName: lastName));

        expect(result, equals(Right(testRegistrationModel)));
      },
    );

    test(
      'should return server failure when the call is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.signUp(email: email, password: password, firstName: firstName, lastName: lastName))
            .thenThrow(ServerException());
        // act
        final result = await repository.signUp(email: email, password: password, firstName: firstName, lastName: lastName);
        // assert
        verify(mockRemoteDataSource.signUp(email: email, password: password, firstName: firstName, lastName: lastName));
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });



}