import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecase/authentication_usecase.dart';
import 'authentication_state.dart';

class AuthNotifier extends StateNotifier<AuthenticationState> {
  Login login;
  Register register;
  AuthNotifier(this.login, this.register)
      : super(const AuthenticationInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      state = const AuthenticationLoading();
      final result = await login(UserParams(email: email, password: password));

      result
          .fold((error) => state = AuthenticationError(message: "Login failed"),
              (result) {
        state = AuthenticationLoaded(email: result.email!);
        print('email ${result.email!}');
      });
    } catch (e) {
      state = AuthenticationError(message: "Login failed");
    }
  }

  Future<void> registerUser(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      state = const AuthenticationLoading();
      final result =
          await register(UserParams(email: email, password: password, firstName: firstName, lastName: lastName));

      result.fold(
          (error) =>
              state = AuthenticationError(message: "Registration failed"),
          (result) async {
        state = AuthenticationLoaded(email: result.email!);

        print('email ${result.email!}');
      });
    } catch (e) {
      state = AuthenticationError(message: "Registration failed");
    }
  }

  AuthenticationState currentState() {
    return state;
  }
}
