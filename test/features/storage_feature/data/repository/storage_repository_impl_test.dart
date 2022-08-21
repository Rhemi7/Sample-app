

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_app/features/storage_feature/data/data_source/storage_local_data_source.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/storage_feature/data/repository/storage_repository_impl.dart';

class MockStorageLocalDatasource extends Mock implements StorageLocalDataSource {}


void main() {
  late MockStorageLocalDatasource mockStorageLocalDatasource;
  late StorageRepositoryImpl repository;

  mockStorageLocalDatasource = MockStorageLocalDatasource();
  repository = StorageRepositoryImpl(mockStorageLocalDatasource);

  final tFriendModel = [
    const FriendModel(
        firstName: "John",
        lastName: "Doe",
        phoneNumber: "25537748",
        countryCode: "+234",
        address: "13 Brick Avenue",
        email: "abc@xyz.com"
    ),
    const FriendModel(
        firstName: "John",
        lastName: "Doe",
        phoneNumber: "25537748",
        countryCode: "+234",
        address: "13 Brick Avenue",
        email: "abc@xyz.com"
    ),
    const FriendModel(
        firstName: "John",
        lastName: "Doe",
        phoneNumber: "25537748",
        countryCode: "+234",
        address: "13 Brick Avenue",
        email: "abc@xyz.com"
    ),
  ];

  var tModel = const FriendModel(
      firstName: "John",
      lastName: "Doe",
      phoneNumber: "25537748",
      countryCode: "+234",
      address: "13 Brick Avenue",
      email: "abc@xyz.com"
  );


  group("Add Friend", () {

    test("Should return local data when call is successful", () async {
      when(mockStorageLocalDatasource.addToFriends(tModel)).thenAnswer((_) async => tFriendModel);

      final result = await repository.addToFriends(tModel);

      verify(mockStorageLocalDatasource.addToFriends(tModel));

      expect(result, equals(Right(tFriendModel)));
    });
  });

  group("Edit Friend", () {
    test("Should return local data when call is successful", () async {
      when(mockStorageLocalDatasource.editFriend(model: tModel, index: 1)).thenAnswer((_) async => tFriendModel);

      final result = await repository.editFriends(model: tModel, index: 1);

      verify(mockStorageLocalDatasource.editFriend(model: tModel, index: 1));

      expect(result, equals(Right(tFriendModel)));
    });
  });

  group("Delete Friend", () {
    test("Should return local data when call is successful", () async {
      when(mockStorageLocalDatasource.deleteFriend(1)).thenAnswer((_) async => tFriendModel);

      final result = await repository.deleteFriend(1);

      verify(mockStorageLocalDatasource.deleteFriend(1));

      expect(result, equals(Right(tFriendModel)));
    });
  });
}