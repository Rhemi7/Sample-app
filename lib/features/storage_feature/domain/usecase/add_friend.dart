import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failure.dart';
import 'package:sample_app/core/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_app/features/storage_feature/domain/repository/storage_repository.dart';
import '../../data/model/friend_model.dart';

class AddFriend extends UseCase<List<FriendModel>, FriendParam> {
  StorageRepository storageRepository;
  AddFriend(this.storageRepository);

  @override
  Future<Either<Failure, List<FriendModel>>> call(params) async {
    return await storageRepository.addToFriends(FriendModel(
        firstName: params.firstName,
        lastName: params.lastName,
        countryCode: params.countryCode,
        phoneNumber: params.phoneNumber,
        address: params.address,
        email: params.email));
  }
}

class FriendParam extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? countryCode;
  final String? phoneNumber;

  const FriendParam(this.firstName, this.lastName, this.email, this.phoneNumber,
      this.countryCode, this.address);

  @override
  List<Object?> get props =>
      [firstName, lastName, address, email, countryCode, phoneNumber];
}
