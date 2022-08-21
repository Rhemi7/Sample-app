
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/features/authentication_feature/domain/usecase/authentication_usecase.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/authentication_notifier/authentication_notifier.dart';
import '../../../../service_locator.dart';
import '../notifier/authentication_notifier/authentication_state.dart';

final loginProvider = Provider<Login>((ref) => Login(sl()));

final registerProvider = Provider<Register>((ref) => Register(sl()));

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthenticationState>((ref) => AuthNotifier(ref.watch(loginProvider), ref.watch(registerProvider)));