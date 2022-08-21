import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/features/storage_feature/data/data_source/storage_local_data_source.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/data_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}


void main() {
  late MockSharedPreferences mockPref;
  late StorageLocalDataSourceImpl dataSource;


  setUp(() {
    mockPref = MockSharedPreferences();
    dataSource = StorageLocalDataSourceImpl(mockPref);
  });

  var tModel = const FriendModel(
      firstName: "John",
      lastName: "Doe",
      phoneNumber: "25537748",
      countryCode: "+234",
      address: "13 Brick Avenue",
      email: "abc@xyz.com"
  );

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


  group("GetCacheFriends", () {
    test('Return List<FriendModel> when cache is available', () async {
      when(mockPref.getString(cachedFriendsString))
          .thenReturn(dataReader('friends_list.json'));

      expect(await dataSource.getCachedFriends(), isA<List<FriendModel>>());
    });

    test('Return cacheException when no cache is available', () async {
      when(mockPref.getString(cachedFriendsString)).thenReturn(null);

      expect(() => dataSource.getCachedFriends(),
          throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group("Add friend to list", () {
    test("Should return List<FriendModel> when a friend has been added", () async {
      when(mockPref.getString(cachedFriendsString))
          .thenReturn(dataReader('friends_list.json'));

      expect(await dataSource.addToFriends(tModel), isA<List<FriendModel>>());
    });
  });

  group("Delete friend from list", () {
    int index = 1;
    test("Should return List<FriendModel> after deleting friend", () async {
      when(mockPref.getString(cachedFriendsString))
          .thenReturn(dataReader('friends_list.json'));

      expect(await dataSource.deleteFriend(index), isA<List<FriendModel>>());
    });
  });

  group("Edit friend in list", () {
    test("Should return List<FriendModel> when a friend has been edited", () async {
      when(mockPref.getString(cachedFriendsString))
          .thenReturn(dataReader('friends_list.json'));

      expect(await dataSource.editFriend(model: tModel, index: 1), isA<List<FriendModel>>());
    });
  });
}
