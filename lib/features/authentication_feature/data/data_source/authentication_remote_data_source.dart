import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_app/features/authentication_feature/data/model/login_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/refresh_token_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/registration_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/update_profile_response.dart';
import 'package:sample_app/features/authentication_feature/data/model/user_data.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/failure.dart';
import '../../../user_feature/presentation/utils/constants.dart';

abstract class AuthRemoteDatasource {
  Future<RegistrationResponse> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName});

  Future<LoginResponse> login(
      {required String email, required String password});

  Future updateProfile(
      {required String email,
      required String firstName,
      required String lastName,
      required String idToken});

  Future<UserData> getProfile();

  Future refreshToken();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final http.Client client;
  SharedPreferences sharedPreferences;
  AuthRemoteDatasourceImpl(this.client, this.sharedPreferences);

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    Map<String, dynamic> body = {
      "email": email.toLowerCase().trim(),
      "password": password.trim(),
      "returnSecureToken": true
    };

    Map<String, String> headers = {"Content-Type": "application/json"};

    final response = await client.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$kAPIkey'),
      body: jsonEncode(body),
      headers: headers,
    );

    print("response $response");

    if (response.statusCode == 200) {
      var result = loginResponseFromJson(response.body);
      sharedPreferences.setString(refreshTokenString, result.refreshToken!);
      sharedPreferences.setString(idTokenString, result.idToken!);

      print("refreshToken ${result.refreshToken}");
      print("result $result");
      return result;
    } else {
      await refreshToken();

      print("server exception");
      throw ServerException();
    }
  }

  @override
  Future<RegistrationResponse> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    Map<String, dynamic> body = {
      "email": email.toLowerCase().trim(),
      "password": password.trim(),
      "returnSecureToken": true
    };

    Map<String, String> headers = {"Content-Type": "application/json"};

    final response = await client.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$kAPIkey'),
        body: jsonEncode(body),
        headers: headers);
    print("register response $response");

    if (response.statusCode == 200) {
      var result = registrationResponseFromJson(response.body);
      sharedPreferences.setString(refreshTokenString, result.refreshToken!);
      sharedPreferences.setString(idTokenString, result.idToken!);

      print("register id token ${result.idToken!}");

      await updateProfile(
          email: email,
          firstName: firstName,
          lastName: lastName,
          idToken: result.idToken!);

      return result;
    } else {
      print("server exception");

      throw ServerException();
    }
  }

  @override
  Future refreshToken() async {
    Map<String, String> headers = {"Content-Type": "application/json"};

    final url =
        Uri.parse('https://securetoken.googleapis.com/v1/token?key=$kAPIkey');

    var refreshToken = sharedPreferences.getString(refreshTokenString);

    try {
      final response = await client.post(url,
          headers: headers,
          body: json.encode({
            'grant_type': "refresh_token",
            'refresh_token': refreshToken,
          }));

      if (response.statusCode == 200) {
        var result = refreshTokenResponseFromJson(response.body);
        sharedPreferences.setString(refreshTokenString, result.refreshToken!);
        sharedPreferences.setString(idTokenString, result.idToken!);

        print("refresh response $result");

        return result;
      } else {
        print("token server exception");

        throw ServerException();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future updateProfile(
      {required String email,
      required String firstName,
      required String lastName,
      required String idToken}) async {

    Map<String, dynamic> body = {
      "email": email.toLowerCase().trim(),
      "idToken": idToken,
      "displayName": "$firstName $lastName",
      "photoUrl": "[URL]",
      "returnSecureToken": true
    };

    Map<String, String> headers = {"Content-Type": "application/json"};

    final response = await client.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:update?key=$kAPIkey'),
        body: jsonEncode(body),
        headers: headers);

    print("update profile response $response");
    print("server ${response.body}");

    print("statuscode ${response.statusCode}");

    if (response.statusCode == 200) {
      var result = updateProfileResponseFromJson(response.body);
      return result;
    } else {
      print("server ${response.body}");
      print("server exception");

      throw ServerException();
    }
  }

  @override
  Future<UserData> getProfile() async {
    var jsonString = sharedPreferences.getString(idTokenString);
    print("IDTokun $jsonString");
    Map<String, dynamic> body = {"idToken": jsonString};

    Map<String, String> headers = {"Content-Type": "application/json"};

    final response = await client.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=$kAPIkey'),
      body: jsonEncode(body),
      headers: headers,
    );

    print("response $response");

    if (response.statusCode == 200) {
      var result = userDataFromJson(response.body);

      print("result $result");
      return result;
    } else {
      await refreshToken();

      print("server exception");
      throw ServerException();
    }
  }
}
