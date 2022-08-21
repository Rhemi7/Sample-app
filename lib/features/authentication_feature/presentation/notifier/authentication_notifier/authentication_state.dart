

abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

class AuthenticationLoaded extends AuthenticationState {
  final String email;
  AuthenticationLoaded({required this.email});
}

class AuthenticationError extends AuthenticationState {
  String message;
  AuthenticationError({required this.message});
}