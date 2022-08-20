
// import 'package:currency_calculator/features/currency_calculator/data/datasources/currency_converter_remote_data_source.dart';
// import 'package:currency_calculator/features/currency_calculator/data/repositories/currency_converter_implementation.dart';
// import 'package:currency_calculator/features/currency_calculator/domain/repositories/currency_converter_repository.dart';
// import 'package:currency_calculator/features/currency_calculator/domain/usecases/get_currency_rate.dart';
// import 'package:currency_calculator/features/currency_calculator/presentation/notifier/converter_notifier/converter_notifier.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

// import 'core/network_info/network_info.dart';


GetIt sl = GetIt.instance;

Future<void> setUpLocator() async {

  // //Riverpod State notifiers
  // sl.registerLazySingleton(() => ConverterNotifier(sl()));
  //
  // //Currency Converter Repository
  // sl.registerLazySingleton<CurrencyConverterRepository>(() => CurrencyConverterRepositoryImpl(
  //   networkInfo: sl(),
  //   remoteDataSource: sl(),
  // ));
  //
  // //Currency Data sources
  // sl.registerLazySingleton<ConverterRemoteDataSource>(
  //         () => ConverterRemoteDataSourceImpl(client: sl()));
  //
  // //Network info
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //
  // //Usecases
  // sl.registerLazySingleton<GetConversionRate>(() => GetConversionRate(sl()));

  //Data connection
  // sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerLazySingleton(() => http.Client());
}
