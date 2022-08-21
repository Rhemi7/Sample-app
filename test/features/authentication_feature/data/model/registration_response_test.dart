import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/features/authentication_feature/data/model/registration_response.dart';
import '../../../../data/data_reader.dart';

void main() {
  final testRegistrationModel = RegistrationResponse(
      localId: "ZY1rJK0eYLg...",
      email: "[user@example.com]",
      idToken: "[ID_TOKEN]",
      refreshToken: "[REFRESH_TOKEN]",
      expiresIn: "3600"
  );

  test(
    'should be a subclass of Registration Response',
        () async {
      // assert
      expect(testRegistrationModel, isA<RegistrationResponse>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when fromJson is called',
          () async {
        final jsonString = dataReader('registration_response.json');
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        final result = RegistrationResponse.fromJson(jsonMap);
        expect(result, testRegistrationModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        // act
        final result = testRegistrationModel.toJson();
        // assert
        final expectedMap = {
          "localId": "ZY1rJK0eYLg...",
          "email": "[user@example.com]",
          // "kind": "gdhgsdg",
          "idToken": "[ID_TOKEN]",
          "refreshToken": "[REFRESH_TOKEN]",
          "expiresIn": "3600"
        };
        expect(result, expectedMap);
      },
    );
  });
}
