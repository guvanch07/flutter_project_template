// ignore_for_file: uri_does_not_exist, undefined_identifier

import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{project_name}}/data/data.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/repositories/repositories.dart';
import 'package:{{project_name}}/internal/analytics/analytics.dart';
import 'package:{{project_name}}/internal/config/config.dart';
import 'package:{{project_name}}/presentation/blocs/blocs.dart';
import 'package:{{project_name}}/presentation/cubits/cubits.dart';
import 'package:{{project_name}}/presentation/utils/connectivity_service.dart';

final getIt = GetIt.instance;
// Alias for backward compatibility with di.locator usage
final locator = getIt;

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

  getIt.registerLazySingleton<ConnectivityService>(ConnectivityService);

  // Cubits
  getIt.registerLazySingleton<AnalyticsLoggerCubit>(AnalyticsLoggerCubit);
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(preferencesRepository: getIt<PreferencesRepository>()),
  );
  getIt.registerLazySingleton<LogCubit>(LogCubit);
  getIt.registerLazySingleton<ConnectivityCubit>(
    () => ConnectivityCubit(connectivityService: getIt<ConnectivityService>()),
  );

  // Repositories
  getIt.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(
      sharedPreferences: SharedPreferencesAsync.instance,
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
}

void initUiData({required CommonUiData data}) {
  if (!getIt.isRegistered<CommonUiData>()) {
    getIt.registerSingleton<CommonUiData>(data);
  } else if (getIt<CommonUiData>() != data) {
    getIt.unregister<CommonUiData>();
    getIt.registerSingleton<CommonUiData>(data);
  }
}
