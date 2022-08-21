import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/add_friend.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/delete_friend.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/edit_friend.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/get_cached_friends.dart';
import 'package:sample_app/features/storage_feature/presentation/notifier/storage_state.dart';
import '../../../../service_locator.dart';
import '../notifier/storage_notifier.dart';

final addFriendProvider = Provider<AddFriend>((ref) => AddFriend(sl()));

final deleteFriendProvider =
    Provider<DeleteFriend>((ref) => DeleteFriend(sl()));

final deleteProvider = Provider<Delete>((ref) => Delete(sl()));

final getCachedFriendsProvider =
    Provider<GetCachedFriends>((ref) => GetCachedFriends(sl()));

final editFriendProvider = Provider<EditFriend>((ref) => EditFriend(sl()));

final storageNotifierProvider =
    StateNotifierProvider<StorageNotifier, StorageState>((ref) =>
        StorageNotifier(
            ref.watch(addFriendProvider),
            ref.watch(deleteFriendProvider),
            ref.watch(deleteProvider),
            ref.watch(getCachedFriendsProvider),
        ref.watch(editFriendProvider),
        ));
