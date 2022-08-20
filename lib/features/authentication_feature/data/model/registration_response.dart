// To parse this JSON data, do
//
//     final registrationResponse = registrationResponseFromJson(jsonString);

import 'dart:convert';

import 'package:sample_app/features/authentication_feature/domain/entity/registration_entity.dart';

RegistrationResponse registrationResponseFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) => json.encode(data.toJson());

// ignore: must_be_immutable
class RegistrationResponse extends RegistrationEntity{
  RegistrationResponse({
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
    // kind: json["kind"],
    idToken: json["idToken"],
    email: json["email"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
    localId: json["localId"],
  );

  Map<String, dynamic> toJson() => {
    // "kind": kind,
    "idToken": idToken,
    "email": email,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
    "localId": localId,
  };
}
