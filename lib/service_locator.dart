
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:sample_app/features/authentication_feature/data/data_source/authentication_remote_data_source.dart';
import 'package:sample_app/features/authentication_feature/data/repository/auth_repository_impl.dart';
import 'package:sample_app/features/authentication_feature/domain/repository/auth_repository.dart';
import 'package:sample_app/features/authentication_feature/domain/usecase/authentication_usecase.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/authentication_notifier/authentication_notifier.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/user_data_notifier/user_data_notifier.dart';
import 'package:sample_app/features/storage_feature/data/data_source/storage_local_data_source.dart';
import 'package:sample_app/features/storage_feature/data/repository/storage_repository_impl.dart';
import 'package:sample_app/features/storage_feature/domain/repository/storage_repository.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/add_friend.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/delete_friend.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/edit_friend.dart';
import 'package:sample_app/features/storage_feature/domain/usecase/get_cached_friends.dart';
import 'package:sample_app/features/storage_feature/presentation/notifier/storage_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> setUpLocator() async {

  //Riverpod state notifiers
  sl.registerLazySingleton(() => AuthNotifier(sl(), sl()));

  sl.registerLazySingleton(() => UserDataNotifier(sl()));

  sl.registerLazySingleton(() => StorageNotifier(sl(), sl(), sl(), sl(), sl()));

  //Http Client
  sl.registerLazySingleton(() => http.Client());

  //Authentication
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(sl(), sl()));

  //Authentication Use cases
  sl.registerLazySingleton<Login>(() => Login(sl()));

  sl.registerLazySingleton<Register>(() => Register(sl()));

  sl.registerLazySingleton<GetUser>(() => GetUser(sl()));


  // Storage
  sl.registerLazySingleton<StorageLocalDataSource>(() => StorageLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<StorageRepository>(() => StorageRepositoryImpl(sl()));

  // Storage use cases
  sl.registerLazySingleton<DeleteFriend>(() => DeleteFriend(sl()));

  sl.registerLazySingleton<AddFriend>(() => AddFriend(sl()));

  sl.registerLazySingleton<GetCachedFriends>(() => GetCachedFriends(sl()));

  sl.registerLazySingleton<EditFriend>(() => EditFriend(sl()));

  sl.registerLazySingleton<Delete>(() => Delete(sl()));

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);


}
