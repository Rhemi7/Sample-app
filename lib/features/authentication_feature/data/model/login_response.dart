
// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:sample_app/features/authentication_feature/domain/entity/registration_entity.dart';

import '../../domain/entity/login_entity.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

// ignore: must_be_immutable
class LoginResponse extends LoginEntity {
  LoginResponse({
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
    this.refreshToken,
    this.expiresIn,
  });


  final String? localId;
  final String? email;
  final String? displayName;
  final String ?idToken;
  final bool? registered;
  final String? refreshToken;
  final String? expiresIn;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    localId: json["localId"],
    email: json["email"],
    displayName: json["displayName"],
    idToken: json["idToken"],
    registered: json["registered"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
  );

  Map<String, dynamic> toJson() => {
    "localId": localId,
    "email": email,
    "displayName": displayName,
    "idToken": idToken,
    "registered": registered,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
  };
}
