import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/features/storage_feature/data/data_source/storage_local_data_source.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/storage_feature/domain/repository/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  StorageLocalDataSource storageLocalDataSource;
  StorageRepositoryImpl(this.storageLocalDataSource);

  @override
  Future<Either<Failure, List<FriendModel>>> addToFriends(
      FriendModel model) async {
    try {
      return storageLocalDataSource.addToFriends(model).then((value) {
        return Right(value);
      });
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> delete() async {
    try {
      return storageLocalDataSource.deleteAll().then((value) {
        return Right(value);
      });
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<FriendModel>>> deleteFriend(int index) async {
    try {
      return storageLocalDataSource.deleteFriend(index).then((value) {
        return Right(value);
      });
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<FriendModel>>> getCachedFriends() async {
    try {
      return storageLocalDataSource.getCachedFriends().then((value) {
        return Right(value);
      });
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
