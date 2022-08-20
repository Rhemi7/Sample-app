import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/authentication_state.dart';

import '../../domain/usecase/authentication_usecase.dart';

class AuthNotifier extends StateNotifier<AuthenticationState> {
  Login login;
  Register register;
  AuthNotifier(this.login, this.register) : super(const AuthenticationInitial());


  Future<void> loginUser({required String email, required String password}) async {
    try {
      state = const AuthenticationLoading();
      final result = await login(UserParams(email: email, password: password));

      result.fold((error) => state = AuthenticationError(message: "Login failed"), (result) {

        state = AuthenticationLoaded(email: result.email!);
        print('email ${result.email!}');

      });
    } catch (e) {
      state = AuthenticationError(message: "Login failed");
    }
  }

  Future<void> registerUser({required String email, required String password}) async {
    try {
      state = const AuthenticationLoading();
      final result = await register(UserParams(email: email, password: password));

      result.fold((error) => state = AuthenticationError(message: "Registration failed"), (result) {
        state = AuthenticationLoaded(email: result.email!);
        print('email ${result.email!}');
      });
    } catch (e) {
      state = AuthenticationError(message: "Login failed");
    }
  }

  AuthenticationState currentState() {
    return state;
  }

}