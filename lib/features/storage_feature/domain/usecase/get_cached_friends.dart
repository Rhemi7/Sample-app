

import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/core/usecases/usecases.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/storage_feature/domain/repository/storage_repository.dart';

class GetCachedFriends extends UseCase<List<FriendModel>, NoParams> {
  StorageRepository storageRepository;
  GetCachedFriends(this.storageRepository);

  @override
  Future<Either<Failure, List<FriendModel>>> call(NoParams params) async {
    return await storageRepository.getCachedFriends();
  }


}