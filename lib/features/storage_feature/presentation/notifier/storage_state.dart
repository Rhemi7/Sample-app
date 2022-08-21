

import '../../data/model/friend_model.dart';

abstract class StorageState {
  const StorageState();
}

class StorageInitial extends StorageState {
  const StorageInitial();
}

class StorageLoading extends StorageState {
  const StorageLoading();
}

class StorageLoaded extends StorageState {
  final List<FriendModel> friends;
  StorageLoaded({required this.friends});
}

class StorageError extends StorageState {
  String message;
  StorageError({required this.message});
}