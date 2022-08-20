
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_app/features/authentication_feature/data/model/login_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/registration_response.dart';

import '../../../../core/error/failure.dart';
import '../../../user_feature/presentation/utils/constants.dart';

abstract class AuthRemoteDatasource {
  Future<RegistrationResponse> signUp({required String email, required String password});

  Future<LoginResponse> login({required String email, required String password});
}


class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final http.Client client;
  AuthRemoteDatasourceImpl(this.client);

  @override
  Future<LoginResponse> login({required String email, required String password}) async {

    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };

    Map<String, String> headers = {"Content-Type": "application/json"};

    final response = await client.post(
        Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$kAPIkey'),
      body: body,
        headers: headers,
    );

    print("response $response");

    if (response.statusCode == 200) {
      var result = loginResponseFromJson(response.body);
      print("result $result");
      return result;
    } else {
      print("server exception");
      throw ServerException();
    }
  }

  @override
  Future<RegistrationResponse> signUp({required String email, required String password}) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };

    Map<String, String> headers = {"Content-Type": "application/json"};


    final response = await client.post(
        Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$kAPIkey'),
        body: jsonEncode(body),
        headers: headers
    );
    print("response $response");


    if (response.statusCode == 200) {
      var result = registrationResponseFromJson(response.body);
      print("result $result");

      return result;
    } else {
      print("server exception");

      throw ServerException();
    }
  }


}