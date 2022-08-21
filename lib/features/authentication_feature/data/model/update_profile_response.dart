// To parse this JSON data, do
//
//     final updateProfileResponse = updateProfileResponseFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponse updateProfileResponseFromJson(String str) => UpdateProfileResponse.fromJson(json.decode(str));

String updateProfileResponseToJson(UpdateProfileResponse data) => json.encode(data.toJson());

class UpdateProfileResponse {
  UpdateProfileResponse({
    this.localId,
    this.email,
    this.displayName,
    this.photoUrl,
    this.passwordHash,
    this.providerUserInfo,
    this.idToken,
    this.refreshToken,
    this.expiresIn,
  });

  String? localId;
  String? email;
  String? displayName;
  String? photoUrl;
  String? passwordHash;
  List<ProviderUserInfo>? providerUserInfo;
  String? idToken;
  String? refreshToken;
  String? expiresIn;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => UpdateProfileResponse(
    localId: json["localId"],
    email: json["email"],
    displayName: json["displayName"],
    photoUrl: json["photoUrl"],
    passwordHash: json["passwordHash"],
    providerUserInfo: List<ProviderUserInfo>.from(json["providerUserInfo"].map((x) => ProviderUserInfo.fromJson(x))),
    idToken: json["idToken"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
  );

  Map<String, dynamic> toJson() => {
    "localId": localId,
    "email": email,
    "displayName": displayName,
    "photoUrl": photoUrl,
    "passwordHash": passwordHash,
    "providerUserInfo": List<dynamic>.from(providerUserInfo!.map((x) => x.toJson())),
    "idToken": idToken,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
  };
}

class ProviderUserInfo {
  ProviderUserInfo({
    this.providerId,
    this.federatedId,
    this.displayName,
    this.photoUrl,
  });

  String? providerId;
  String? federatedId;
  String? displayName;
  String? photoUrl;

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) => ProviderUserInfo(
    providerId: json["providerId"],
    federatedId: json["federatedId"],
    displayName: json["displayName"],
    photoUrl: json["photoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "providerId": providerId,
    "federatedId": federatedId,
    "displayName": displayName,
    "photoUrl": photoUrl,
  };
}
