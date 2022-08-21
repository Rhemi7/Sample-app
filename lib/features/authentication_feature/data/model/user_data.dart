// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.users,
  });

  List<User>? users;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.localId,
    this.email,
    this.emailVerified,
    this.displayName,
    this.providerUserInfo,
    this.photoUrl,
    this.passwordHash,
    this.passwordUpdatedAt,
    this.validSince,
    this.disabled,
    this.lastLoginAt,
    this.createdAt,
    this.customAuth,
  });

  String? localId;
  String? email;
  bool? emailVerified;
  String? displayName;
  List<ProviderUserInfo>? providerUserInfo;
  String? photoUrl;
  String? passwordHash;
  int? passwordUpdatedAt;
  String? validSince;
  bool? disabled;
  String? lastLoginAt;
  String? createdAt;
  bool? customAuth;

  factory User.fromJson(Map<String, dynamic> json) => User(
    localId: json["localId"],
    email: json["email"],
    emailVerified: json["emailVerified"],
    displayName: json["displayName"],
    providerUserInfo: List<ProviderUserInfo>.from(json["providerUserInfo"].map((x) => ProviderUserInfo.fromJson(x))),
    photoUrl: json["photoUrl"],
    passwordHash: json["passwordHash"],
    passwordUpdatedAt: json["passwordUpdatedAt"],
    validSince: json["validSince"],
    disabled: json["disabled"],
    lastLoginAt: json["lastLoginAt"],
    createdAt: json["createdAt"],
    customAuth: json["customAuth"],
  );

  Map<String, dynamic> toJson() => {
    "localId": localId,
    "email": email,
    "emailVerified": emailVerified,
    "displayName": displayName,
    "providerUserInfo": List<dynamic>.from(providerUserInfo!.map((x) => x.toJson())),
    "photoUrl": photoUrl,
    "passwordHash": passwordHash,
    "passwordUpdatedAt": passwordUpdatedAt,
    "validSince": validSince,
    "disabled": disabled,
    "lastLoginAt": lastLoginAt,
    "createdAt": createdAt,
    "customAuth": customAuth,
  };
}

class ProviderUserInfo {
  ProviderUserInfo({
    this.providerId,
    this.displayName,
    this.photoUrl,
    this.federatedId,
    this.email,
    this.rawId,
    this.screenName,
  });

  String? providerId;
  String? displayName;
  String? photoUrl;
  String? federatedId;
  String? email;
  String? rawId;
  String? screenName;

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) => ProviderUserInfo(
    providerId: json["providerId"],
    displayName: json["displayName"],
    photoUrl: json["photoUrl"],
    federatedId: json["federatedId"],
    email: json["email"],
    rawId: json["rawId"],
    screenName: json["screenName"],
  );

  Map<String, dynamic> toJson() => {
    "providerId": providerId,
    "displayName": displayName,
    "photoUrl": photoUrl,
    "federatedId": federatedId,
    "email": email,
    "rawId": rawId,
    "screenName": screenName,
  };
}
