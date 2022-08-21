
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/features/authentication_feature/data/data_source/authentication_remote_data_source.dart';
import 'package:sample_app/features/authentication_feature/data/repository/auth_repository_impl.dart';
import 'package:sample_app/features/authentication_feature/domain/repository/auth_repository.dart';
import 'package:sample_app/features/authentication_feature/domain/usecase/authentication_usecase.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/authentication_notifier.dart';
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

  sl.registerLazySingleton(() => AuthNotifier(sl(), sl()));

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(sl(), sl()));

  sl.registerLazySingleton<Login>(() => Login(sl()));

  sl.registerLazySingleton<Register>(() => Register(sl()));

  sl.registerLazySingleton(() => StorageNotifier(sl(), sl(), sl(), sl(), sl()));

  sl.registerLazySingleton<StorageLocalDataSource>(() => StorageLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<StorageRepository>(() => StorageRepositoryImpl(sl()));

  sl.registerLazySingleton<DeleteFriend>(() => DeleteFriend(sl()));

  sl.registerLazySingleton<AddFriend>(() => AddFriend(sl()));

  sl.registerLazySingleton<GetCachedFriends>(() => GetCachedFriends(sl()));

  sl.registerLazySingleton<EditFriend>(() => EditFriend(sl()));

  sl.registerLazySingleton<Delete>(() => Delete(sl()));

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);


}
