import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mason_demo/data/data.dart';
import 'package:mason_demo/domain/entities/entities.dart';
import 'package:mason_demo/domain/repositories/repositories.dart';
import 'package:mason_demo/internal/analytics/analytics.dart';
import 'package:mason_demo/internal/analytics/service.dart';
import 'package:mason_demo/internal/config/config.dart';
import 'package:mason_demo/presentation/blocs/blocs.dart';
import 'package:mason_demo/presentation/cubits/cubits.dart';
import 'package:mason_demo/presentation/utils/connectivity_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
// Alias for backward compatibility with di.locator usage
final locator = getIt;

Future<void> configureDependencies() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt
    ..registerSingleton<SharedPreferences>(sharedPreferences)
    ..registerLazySingleton<Dio>(NetworkModule.provideDio)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
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
    ..registerLazySingleton<ConnectivityService>(ConnectivityService.new)
    ..registerLazySingleton<AnalyticsLoggerCubit>(
      AnalyticsLoggerCubit.new,
    ) // Keep AnalyticsLoggerCubit as it is used in AnalyticsService
    ..registerLazySingleton<LogCubit>(LogCubit.new)
    ..registerLazySingleton<ConnectivityCubit>(
      () =>
          ConnectivityCubit(connectivityService: getIt<ConnectivityService>()),
    )
    // Repositories
    ..registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(
        sharedPreferences: SharedPreferencesAsync(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplFirebase(
        firebaseAuth: getIt<FirebaseAuth>(),
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<NotificationRepository>(
      NotificationRepositoryImpl.new,
    )
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
