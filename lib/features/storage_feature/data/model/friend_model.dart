// To parse this JSON data, do
//
//     final friendModel = friendModelFromJson(jsonString);

import 'dart:convert';

import 'package:sample_app/features/storage_feature/domain/entity/friend_entity.dart';

class FriendModel extends FriendEntity{
 const FriendModel({
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.countryCode,
    this.phoneNumber,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? countryCode;
  final String? phoneNumber;

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    address: json["address"],
    countryCode: json["country_code"],
    phoneNumber: json["phone_number"],
  );

  static Map<String, dynamic> toJson(FriendModel friend) => {
    "first_name": friend.firstName,
    "last_name": friend.lastName,
    "email": friend.email,
    "address": friend.address,
    "country_code": friend.countryCode,
    "phone_number": friend.phoneNumber,
  };

  static String encode(List<FriendModel> friends) => json.encode(
    friends
        .map<Map<String, dynamic>>((friend) => FriendModel.toJson(friend))
        .toList(),
  );

  static List<FriendModel> decode(String friends) =>
      (json.decode(friends) as List<dynamic>)
          .map<FriendModel>((item) => FriendModel.fromJson(item))
          .toList();
}
