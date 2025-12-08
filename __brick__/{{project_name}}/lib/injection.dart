import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{project_name}}/data/remote/api_client.dart';
import 'package:{{project_name}}/data/remote/network_module.dart';
import 'package:{{project_name}}/data/repositories/auth_repository_impl_firebase.dart';
import 'package:{{project_name}}/data/repositories/notification_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/preferences_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/remote_config_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/secure_storage_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/storage_repository_impl.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';
import 'package:{{project_name}}/domain/repositories/notification_repository.dart';
import 'package:{{project_name}}/domain/repositories/preferences_repository.dart';
import 'package:{{project_name}}/domain/repositories/remote_config_repository.dart';
import 'package:{{project_name}}/domain/repositories/secure_storage_repository.dart';
import 'package:{{project_name}}/domain/repositories/storage_repository.dart';
import 'package:{{project_name}}/internal/analytics/providers/firebase.dart';
import 'package:{{project_name}}/internal/analytics/service.dart';
import 'package:{{project_name}}/internal/config/app_constants.dart';
import 'package:{{project_name}}/presentation/blocs/blocs.dart';
import 'package:{{project_name}}/presentation/cubits/connectivity/connectivity_cubit.dart';
import 'package:{{project_name}}/presentation/cubits/log/log_cubit.dart';
import 'package:{{project_name}}/presentation/cubits/theme/theme_cubit.dart';
import 'package:{{project_name}}/presentation/utils/connectivity_service.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<Dio>(NetworkModule.provideDio);

  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // Services
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));

  await initFirebaseAnalytics(
    appEnv: AppConstants.env,
    locator: GetIt.instance,
  );

  getIt.registerLazySingleton<AnalyticsService>(
    () => AnalyticsServiceImpl(
      appEnv: AppConstants.env,
      firebaseAnalytics: getIt.isRegistered<FirebaseAnalytics>()
          ? getIt<FirebaseAnalytics>()
          : null,
      amplitude: null,
      smartlook: null,
      appsflyer: null,
    ),
  );

  getIt.registerLazySingleton<ConnectivityService>(() => ConnectivityService());

  // Cubits
  getIt.registerLazySingleton<AnalyticsLoggerCubit>(
    () => AnalyticsLoggerCubit(),
  );
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(preferencesRepository: getIt<PreferencesRepository>()),
  );
  getIt.registerLazySingleton<LogCubit>(() => LogCubit());
  getIt.registerLazySingleton<ConnectivityCubit>(
    () => ConnectivityCubit(connectivityService: getIt<ConnectivityService>()),
  );

  // Repositories
  getIt.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplFirebase(),
  );
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(),
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
}
