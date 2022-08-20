import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/features/authentication_feature/data/data_source/authentication_remote_data_source.dart';
import 'package:sample_app/features/authentication_feature/data/model/login_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/registration_response.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';
import 'package:matcher/matcher.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../data/data_reader.dart';

class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])

void main() {
  late MockClient client;
  late AuthRemoteDatasourceImpl dataSource;

  var url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$kAPIkey');
  var loginUrl = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$kAPIkey");

  String email = "abc@xyz.com";
  String password = "password";

  Map<String, dynamic> body = {
    "email": "abc@xyz.com",
    "password": "password",
    "returnSecureToken": true
  };

  Map<String, String> headers = {"Content-Type": "application/json"};


  setUp(() {
    client = MockClient();
    dataSource = AuthRemoteDatasourceImpl(client);
  });

  group('Register', () {
    test('returns a registration response if the http call completes successfully',
            () async {
          when(client.post(url, body: jsonEncode(body),
              headers: headers)).thenAnswer(
                  (_) async => http.Response(dataReader('registration_response.json'), 200));

          expect(await dataSource.signUp(email: email, password: password), isA<RegistrationResponse>());
        });

    test('throws an exception if the http call completes with an error', () {
      when(client.post(url, body: jsonEncode(body),
          headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => dataSource.signUp(email: email, password: password),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group('Login', () {
    test('returns a login response if the http call is successful',
            () async {
          when(client.post(loginUrl, body: jsonEncode(body),
              headers: headers)).thenAnswer(
                  (_) async => http.Response(dataReader('login_response.json'), 200));

          expect(await dataSource.login(email: email, password: password), isA<LoginResponse>());
        });

    test('throws an exception if the http call completes with an error', () {
      when(client.post(loginUrl, body: jsonEncode(body),
          headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => dataSource.login(email: email, password: password),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}