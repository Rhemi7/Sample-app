import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/features/authentication_feature/data/model/login_response.dart';
import '../../../../data/data_reader.dart';

void main() {
  final testLoginModel = LoginResponse(
      localId: "ZY1rJK0eYLg...",
      email: "[user@example.com]",
      displayName: "",
      idToken: "[ID_TOKEN]",
      registered: true,
      refreshToken: "[REFRESH_TOKEN]",
      expiresIn: "3600"
  );

  test(
    'should be a subclass of Login Response',
        () async {
      // assert
      expect(testLoginModel, isA<LoginResponse>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when fromJson is called',
          () async {
        final jsonString = dataReader('login_response.json');
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        final result = LoginResponse.fromJson(jsonMap);
        expect(result, testLoginModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        // act
        final result = testLoginModel.toJson();
        // assert
        final expectedMap = {
          "localId": "ZY1rJK0eYLg...",
          "email": "[user@example.com]",
          "displayName": "",
          "idToken": "[ID_TOKEN]",
          "registered": true,
          "refreshToken": "[REFRESH_TOKEN]",
          "expiresIn": "3600"
        };
        expect(result, expectedMap);
      },
    );
  });
}
