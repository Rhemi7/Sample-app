import 'package:equatable/equatable.dart';

class FriendEntity extends Equatable{
  const FriendEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.countryCode,
    this.phoneNumber,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? countryCode;
  final String? phoneNumber;

  @override
  List<Object?> get props => [firstName, lastName, address, email, countryCode, phoneNumber];
}