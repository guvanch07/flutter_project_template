import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{project_name}}/data/remote/api_client.dart';
import 'package:{{project_name}}/data/repositories/auth_repository_impl_firebase.dart';
import 'package:{{project_name}}/data/repositories/notification_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/preferences_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/secure_storage_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/storage_repository_impl.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';
import 'package:{{project_name}}/domain/repositories/notification_repository.dart';
import 'package:{{project_name}}/domain/repositories/preferences_repository.dart';
import 'package:{{project_name}}/domain/repositories/secure_storage_repository.dart';
import 'package:{{project_name}}/domain/repositories/storage_repository.dart';
import 'package:{{project_name}}/internal/analytics/providers/firebase.dart';
import 'package:{{project_name}}/internal/analytics/service.dart';
import 'package:{{project_name}}/presentation/cubits/connectivity/connectivity_cubit.dart';
import 'package:{{project_name}}/presentation/cubits/log/log_cubit.dart';
import 'package:{{project_name}}/presentation/cubits/theme/theme_cubit.dart';
import 'package:{{project_name}}/presentation/utils/connectivity_service.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<Dio>(Dio);
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // Services
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));
  getIt.registerLazySingleton<AnalyticsService>(FirebaseAnalyticsProvider);
  getIt.registerLazySingleton<ConnectivityService>(
    () => ConnectivityService.instance,
  );

  // Repositories
  getIt.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
  getIt.registerLazySingleton<AuthRepository>(AuthRepositoryImplFirebase);
  getIt.registerLazySingleton<NotificationRepository>(
    NotificationRepositoryImpl,
  );
  getIt.registerLazySingleton<StorageRepository>(
    () => StorageRepositoryImpl(storage: getIt<FirebaseStorage>()),
  );
  getIt.registerLazySingleton<SecureStorageRepository>(
    () => SecureStorageRepositoryImpl(
      secureStorage: getIt<FlutterSecureStorage>(),
    ),
  );
  getIt.registerLazySingleton<FirebaseRemoteConfig>(
    () => FirebaseRemoteConfig.instance,
  );
  getIt.registerLazySingleton<RemoteConfigRepository>(
    () =>
        RemoteConfigRepositoryImpl(remoteConfig: getIt<FirebaseRemoteConfig>()),
  );

  // Cubits - Registered as singletons for app-wide state
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(preferencesRepository: getIt<PreferencesRepository>()),
  );
  getIt.registerLazySingleton<LogCubit>(LogCubit);
  getIt.registerLazySingleton<ConnectivityCubit>(
    () => ConnectivityCubit(connectivityService: getIt<ConnectivityService>()),
  );

  // Feature-specific cubits can be registered as factories
  // getIt.registerFactory(() => HomeCubit());
}
