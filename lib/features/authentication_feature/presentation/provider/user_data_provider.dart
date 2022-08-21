import 'package:sample_app/features/authentication_feature/domain/usecase/authentication_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../service_locator.dart';
import '../notifier/user_data_notifier/user_data_notifier.dart';
import '../notifier/user_data_notifier/user_data_state.dart';

final getUserProvider = Provider<GetUser>((ref) => GetUser(sl()));

final userDataNotifierProvider = StateNotifierProvider<UserDataNotifier, UserDataState>((ref) => UserDataNotifier(ref.watch(getUserProvider)));