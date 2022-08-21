

import 'package:sample_app/features/authentication_feature/data/model/user_data.dart';

abstract class UserDataState {
  const UserDataState();
}

class UserDataInitial extends UserDataState {
  const UserDataInitial();
}

class UserDataLoading extends UserDataState {
  const UserDataLoading();
}

class UserDataLoaded extends UserDataState {
  final UserData data;
  UserDataLoaded({required this.data});
}

class UserDataError extends UserDataState {
  String message;
UserDataError({required this.message});
}