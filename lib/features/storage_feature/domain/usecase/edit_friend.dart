import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/model/friend_model.dart';
import '../repository/storage_repository.dart';
import 'package:dartz/dartz.dart';

class EditFriend extends UseCase<List<FriendModel>, EditFriendParam> {
  StorageRepository storageRepository;
  EditFriend(this.storageRepository);

  @override
  Future<Either<Failure, List<FriendModel>>> call(params) async {
    return await storageRepository.editFriends(model: FriendModel(
        firstName: params.firstName,
        lastName: params.lastName,
        countryCode: params.countryCode,
        phoneNumber: params.phoneNumber,
        address: params.address,
        email: params.email), index: params.index);
  }
}


class EditFriendParam extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? countryCode;
  final String? phoneNumber;
  final int index;

  const EditFriendParam(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.countryCode,
      this.address,
      required this.index});

  @override
  List<Object?> get props =>
      [firstName, lastName, address, email, countryCode, phoneNumber, index];
}