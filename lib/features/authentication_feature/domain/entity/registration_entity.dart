import 'package:equatable/equatable.dart';

class RegistrationEntity extends Equatable {

  RegistrationEntity({
    // this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  // String? kind;
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  @override
  List<Object?> get props => [localId, email, idToken, refreshToken, expiresIn,];
}