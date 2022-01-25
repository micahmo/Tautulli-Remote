import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/local_storage/local_storage.dart';
import 'core/manage_cache/manage_cache.dart';
import 'features/settings/data/datasources/settings_data_source.dart';
import 'features/settings/data/repositories/settings_repository_impl.dart';
import 'features/settings/domain/repositories/settings_repository.dart';
import 'features/settings/domain/usecases/settings.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';

// Service locator alias
final sl = GetIt.instance;

Future<void> init() async {
  //! Core - Local Storage
  sl.registerLazySingleton<LocalStorage>(
    () => LocalStorageImpl(sl()),
  );
  sl.registerLazySingleton<ManageCache>(
    () => ManageCacheImpl(sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DefaultCacheManager());

  //! Features - Settings
  // Bloc
  sl.registerFactory(
    () => SettingsBloc(
      manageCache: sl(),
      settings: sl(),
    ),
  );

  // Use case
  sl.registerLazySingleton(
    () => Settings(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      dataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<SettingsDataSource>(
    () => SettingsDataSourceImpl(
      localStorage: sl(),
    ),
  );
}
