import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/core/usecases/usecases.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/add_friend.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/delete_friend.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/get_cached_friends.dart';
import 'package:sample_app/features/storage_feature/presentation/notifier/storage_state.dart';

import '../../domain/usecase/edit_friend.dart';

class StorageNotifier extends StateNotifier<StorageState> {
  GetCachedFriends getCachedFriends;
  Delete delete;
  DeleteFriend deleteFriend;
  AddFriend addFriend;
  EditFriend editFriend;

  StorageNotifier(this.addFriend, this.deleteFriend, this.delete,
      this.getCachedFriends, this.editFriend)
      : super(const StorageInitial());

  Future addNewFriend(FriendModel model) async {
    try {
      state = const StorageLoading();
      final result = await addFriend(FriendParam(
          model.firstName,
          model.lastName,
          model.email,
          model.phoneNumber,
          model.countryCode,
          model.address));

      result.fold(
          (error) => state = StorageError(message: "Friends cannot be loaded"),
          (result) {
        state = StorageLoaded(friends: result);
      });
    } catch (e) {
      state = StorageError(message: "Friends cannot be loaded");
    }
  }

  Future edit({required FriendModel model, required int index}) async {
    try {
      state = const StorageLoading();
      final result = await editFriend(
        EditFriendParam(
            firstName: model.firstName,
            lastName: model.lastName,
            email: model.email,
            phoneNumber: model.phoneNumber,
            countryCode: model.countryCode,
            address: model.address,
            index: index),
      );

      result.fold(
          (error) => state = StorageError(message: "Friends cannot be loaded"),
          (result) {
        state = StorageLoaded(friends: result);
      });
    } catch (e) {
      state = StorageError(message: "Friends cannot be loaded");
    }
  }

  Future deleteFriendFromList(int index) async {
    try {
      state = const StorageLoading();
      final result = await deleteFriend(IndexParam(index));

      result.fold(
          (error) => state = StorageError(message: "Friend cannot be deleted"),
          (result) {
        state = StorageLoaded(friends: result);
      });
    } catch (e) {
      state = StorageError(message: "Friend cannot be deleted");
    }
  }

  Future getFriends() async {
    try {
      state = const StorageLoading();
      final result = await getCachedFriends(NoParams());

      result.fold(
          (error) => state = StorageError(message: "Friends cannot be loaded"),
          (result) {
        state = StorageLoaded(friends: result);
      });
    } catch (e) {
      state = StorageError(message: "Friends cannot be loaded");
    }
  }

  Future logout() async {
    try {
      state = const StorageLoading();
      final result = await delete(NoParams());

      result.fold((error) => state = StorageError(message: "Error"), (result) {
        state = StorageLoaded(friends: []);
      });
    } catch (e) {
      state = StorageError(message: "Friend cannot be deleted");
    }
  }

  currentState() {
    return state;
  }
}
