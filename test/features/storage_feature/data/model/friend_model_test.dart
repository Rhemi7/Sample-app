import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import '../../../../data/data_reader.dart';

void main() {
  const testFriendModel = FriendModel(
      firstName: "John",
      lastName: "Doe",
      phoneNumber: "25537748",
      countryCode: "+234",
      address: "13 Brick Avenue",
      email: "abc@xyz.com"
  );

  test(
    'should be a subclass of Login Response',
        () async {
      // assert
      expect(testFriendModel, isA<FriendModel>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when fromJson is called',
          () async {
        final jsonString = dataReader('friend_model.json');
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        final result = FriendModel.fromJson(jsonMap);
        expect(result, testFriendModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        // act
        final result = FriendModel.toJson(testFriendModel);
        // assert
        final expectedMap = {
            "first_name": "John",
            "last_name": "Doe",
            "email": "abc@xyz.com",
            "address": "13 Brick Avenue",
            "country_code": "+234",
            "phone_number": "25537748"
        };
        expect(result, expectedMap);
      },
    );
  });
}
