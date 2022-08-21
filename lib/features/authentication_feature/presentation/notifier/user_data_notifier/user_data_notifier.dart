import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/core/usecases/usecases.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/user_data_notifier/user_data_state.dart';

import '../../../domain/usecase/authentication_usecase.dart';

class UserDataNotifier extends StateNotifier<UserDataState> {

  GetUser getUser;
  UserDataNotifier(this.getUser) : super(const UserDataInitial());


  Future<void> getUserData() async {
    try {
      state = const UserDataLoading();
      final result = await getUser(NoParams());

      result.fold((error) => state = UserDataError(message: "Data could not be retrieved"), (result) {
        state = UserDataLoaded(data: result);
      });
    } catch (e) {
      state = UserDataError(message: "Login failed");
    }
  }
}