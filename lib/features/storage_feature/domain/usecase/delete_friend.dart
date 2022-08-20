import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/core/usecases/usecases.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/storage_feature/domain/repository/storage_repository.dart';

class DeleteFriend extends UseCase<List<FriendModel>, IndexParam> {
  StorageRepository storageRepository;
  DeleteFriend(this.storageRepository);
  @override
  Future<Either<Failure, List<FriendModel>>> call(IndexParam params) async {
    return await storageRepository.deleteFriend(params.index);
  }
}

class Delete extends UseCase<void, NoParams> {
  StorageRepository storageRepository;
  Delete(this.storageRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await storageRepository.delete();
  }
}

class IndexParam extends Equatable {
  final int index;
  const IndexParam(this.index);

  @override
  List<Object?> get props => [index];
}
