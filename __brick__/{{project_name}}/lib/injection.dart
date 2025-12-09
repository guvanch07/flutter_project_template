// ignore_for_file: uri_does_not_exist, undefined_identifier

import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{project_name}}/data/data.dart';
import 'package:{{project_name}}/data/repositories/auth_repository_impl_firebase.dart';
import 'package:{{project_name}}/data/repositories/notification_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/preferences_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/remote_config_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/secure_storage_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/storage_repository_impl.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/repositories/repositories.dart';
import 'package:{{project_name}}/internal/analytics/analytics.dart';
import 'package:{{project_name}}/internal/analytics/service.dart';
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

  getIt
    ..registerSingleton<SharedPreferences>(sharedPreferences)
    ..registerLazySingleton<Dio>(NetworkModule.provideDio)
    ..registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance)
    ..registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    )
    // Services
    ..registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()))
    ..registerLazySingleton<AnalyticsService>(
      () => AnalyticsServiceImpl(
        appEnv: AppConstants.env,
        firebaseAnalytics: getIt.isRegistered<FirebaseAnalytics>()
            ? getIt<FirebaseAnalytics>()
            : null,
        amplitude: null,
        smartlook: null,
        appsflyer: null,
      ),
    )
    ..registerLazySingleton<ConnectivityService>(ConnectivityService)
    ..registerLazySingleton<AnalyticsLoggerCubit>(
      AnalyticsLoggerCubit,
    ) // Keep AnalyticsLoggerCubit as it is used in AnalyticsService
    ..registerLazySingleton<LogCubit>(LogCubit)
    // Repositories
    ..registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(
        sharedPreferences: SharedPreferencesAsync(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(AuthRepositoryImplFirebase)
    ..registerLazySingleton<NotificationRepository>(NotificationRepositoryImpl)
    ..registerLazySingleton<StorageRepository>(
      () => StorageRepositoryImpl(storage: getIt<FirebaseStorage>()),
    )
    ..registerLazySingleton<SecureStorageRepository>(
      () => SecureStorageRepositoryImpl(
        secureStorage: getIt<FlutterSecureStorage>(),
      ),
    )
    ..registerLazySingleton<FirebaseRemoteConfig>(
      () => FirebaseRemoteConfig.instance,
    )
    ..registerLazySingleton<RemoteConfigRepository>(
      () => RemoteConfigRepositoryImpl(
        remoteConfig: getIt<FirebaseRemoteConfig>(),
      ),
    );

  // await initFirebaseAnalytics(
  //   appEnv: AppConstants.env,
  //   locator: GetIt.instance,
  // );
}

void initUiData({required CommonUiData data}) {
  if (!getIt.isRegistered<CommonUiData>()) {
    getIt.registerSingleton<CommonUiData>(data);
  } else if (getIt<CommonUiData>() != data) {
    getIt.unregister<CommonUiData>();
    getIt.registerSingleton<CommonUiData>(data);
  }
}
