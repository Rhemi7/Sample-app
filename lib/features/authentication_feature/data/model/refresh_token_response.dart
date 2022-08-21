
// To parse this JSON data, do
//
//     final refreshTokenResponse = refreshTokenResponseFromJson(jsonString);

import 'dart:convert';

RefreshTokenResponse refreshTokenResponseFromJson(String str) => RefreshTokenResponse.fromJson(json.decode(str));

String refreshTokenResponseToJson(RefreshTokenResponse data) => json.encode(data.toJson());

class RefreshTokenResponse {
  RefreshTokenResponse({
    this.expiresIn,
    this.tokenType,
    this.refreshToken,
    this.idToken,
    this.userId,
    this.projectId,
  });

  String? expiresIn;
  String? tokenType;
  String? refreshToken;
  String? idToken;
  String? userId;
  String? projectId;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => RefreshTokenResponse(
    expiresIn: json["expires_in"],
    tokenType: json["token_type"],
    refreshToken: json["refresh_token"],
    idToken: json["id_token"],
    userId: json["user_id"],
    projectId: json["project_id"],
  );

  Map<String, dynamic> toJson() => {
    "expires_in": expiresIn,
    "token_type": tokenType,
    "refresh_token": refreshToken,
    "id_token": idToken,
    "user_id": userId,
    "project_id": projectId,
  };
}
