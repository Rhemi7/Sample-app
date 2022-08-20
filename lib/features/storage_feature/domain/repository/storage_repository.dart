
import 'package:dartz/dartz.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import '../../../../core/error/failure.dart';

abstract class StorageRepository {

  Future<Either<Failure, List<FriendModel>>> addToFriends(FriendModel model);
  Future<Either<Failure, List<FriendModel>>> deleteFriend(int index);
  Future<Either<Failure, List<FriendModel>>> getCachedFriends();
  Future<Either<Failure, void>> delete();



}