import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';

import '../../../../core/error/failure.dart';

abstract class StorageLocalDataSource {

  Future<List<FriendModel>> addToFriends(FriendModel model);

  Future<List<FriendModel>> getCachedFriends();

  Future<List<FriendModel>> editFriend({required FriendModel model, required int index});

  Future<List<FriendModel>> deleteFriend(int index);

  Future<void> deleteAll();
}


class StorageLocalDataSourceImpl implements StorageLocalDataSource {
  final SharedPreferences sharedPreferences;
  StorageLocalDataSourceImpl(this.sharedPreferences);


  @override
  Future<List<FriendModel>> addToFriends(FriendModel model) async {
    List<FriendModel> newFriendsList = [];
    final jsonString = sharedPreferences.getString(cachedFriendsString);
    if(jsonString != null) {
      final List<FriendModel> friends = FriendModel.decode(jsonString);
      friends.add(model);
      final String encodedFriends = FriendModel.encode(friends);
      sharedPreferences.setString(cachedFriendsString, encodedFriends);
      return Future.value(friends);
    } else {
      newFriendsList.add(model);
      final String encodedFriends = FriendModel.encode(newFriendsList);
      sharedPreferences.setString(cachedFriendsString, encodedFriends);
      return Future.value(newFriendsList);
    }
  }

  @override
  Future<List<FriendModel>> deleteFriend(int index) {
    final jsonString = sharedPreferences.getString(cachedFriendsString);
      final List<FriendModel> friends = FriendModel.decode(jsonString!);
      friends.removeAt(index);
      final String encodedFriends = FriendModel.encode(friends);
      sharedPreferences.setString(cachedFriendsString, encodedFriends);
      return Future.value(friends);
  }

  @override
  Future<List<FriendModel>> getCachedFriends() {
    final jsonString = sharedPreferences.getString(cachedFriendsString);
    if (jsonString != null) {
      final List<FriendModel> friends = FriendModel.decode(jsonString);
      return Future.value(friends);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteAll() async {
    sharedPreferences.clear();
  }

  @override
  Future<List<FriendModel>> editFriend({required FriendModel model, required int index}) {
    final jsonString = sharedPreferences.getString(cachedFriendsString);
      final List<FriendModel> friends = FriendModel.decode(jsonString!);
      friends[index] = model;
      final String encodedFriends = FriendModel.encode(friends);
      sharedPreferences.setString(cachedFriendsString, encodedFriends);
      return Future.value(friends);
  }


}