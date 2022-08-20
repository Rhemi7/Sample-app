
// import 'package:currency_calculator/features/currency_calculator/data/datasources/currency_converter_remote_data_source.dart';
// import 'package:currency_calculator/features/currency_calculator/data/repositories/currency_converter_implementation.dart';
// import 'package:currency_calculator/features/currency_calculator/domain/repositories/currency_converter_repository.dart';
// import 'package:currency_calculator/features/currency_calculator/domain/usecases/get_currency_rate.dart';
// import 'package:currency_calculator/features/currency_calculator/presentation/notifier/converter_notifier/converter_notifier.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/features/authentication_feature/data/data_source/authentication_remote_data_source.dart';
import 'package:sample_app/features/authentication_feature/data/repository/auth_repository_impl.dart';
import 'package:sample_app/features/authentication_feature/domain/repository/auth_repository.dart';
import 'package:sample_app/features/authentication_feature/domain/usecase/authentication_usecase.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/authentication_notifier.dart';

// import 'core/network_info/network_info.dart';


GetIt sl = GetIt.instance;

Future<void> setUpLocator() async {

  sl.registerLazySingleton(() => AuthNotifier(sl(), sl()));

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(sl()));

  sl.registerLazySingleton<Login>(() => Login(sl()));

  sl.registerLazySingleton<Register>(() => Register(sl()));
}
