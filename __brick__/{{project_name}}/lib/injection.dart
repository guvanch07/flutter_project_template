import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/data/remote/api_client.dart';
import 'package:{{project_name}}/data/repositories/auth_repository_impl_firebase.dart';
import 'package:{{project_name}}/data/repositories/notification_repository_impl.dart';
import 'package:{{project_name}}/data/repositories/user_repository_impl.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';
import 'package:{{project_name}}/domain/repositories/notification_repository.dart';
import 'package:{{project_name}}/domain/repositories/user_repository.dart';
import 'package:{{project_name}}/internal/analytics/providers/firebase.dart';
import 'package:{{project_name}}/internal/analytics/service.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // External
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Services
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));
  getIt.registerLazySingleton<AnalyticsService>(() => FirebaseAnalyticsProvider());

  // Repositories
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt<ApiClient>()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImplFirebase());
  getIt.registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImpl());
  
  // Blocs/Cubits - Registered as factories usually, or created in UI
  // getIt.registerFactory(() => HomeCubit());
}
