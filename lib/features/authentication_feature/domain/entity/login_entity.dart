import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LoginEntity extends Equatable {

  LoginEntity({
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
    this.refreshToken,
    this.expiresIn,
  });

  String? localId;
  final String? email;
  final String? displayName;
  final String ?idToken;
  final bool? registered;
  final String? refreshToken;
  final String? expiresIn;

  @override
  List<Object?> get props => [localId, email, displayName, idToken, registered, refreshToken, expiresIn];
}