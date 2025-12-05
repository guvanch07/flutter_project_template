import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:{{project_name}}/data/repositories/repositories.dart';
import 'package:{{project_name}}/domain/repositories/repositories.dart';

Future<void> initRemoteConfig({required GetIt locator}) async {
  // Check if already registered
  if (locator.isRegistered<RemoteConfigRepository>()) {
    Print.red('already initialized', name: 'RemoteConfigRepository');
    return;
  }

  FirebaseRemoteConfig? remoteConfig;

  try {
    remoteConfig = FirebaseRemoteConfig.instance;
    locator.registerSingleton<FirebaseRemoteConfig>(remoteConfig);
    Print.green('Firebase Remote Config registered', name: 'Remote Config');
  } catch (e) {
    Print.red(
      'Failed to initialize Firebase Remote Config: $e',
      name: 'Remote Config',
    );
    remoteConfig = null;
  }

  // Always register RemoteConfigRepository, even with null remoteConfig
  locator.registerSingleton<RemoteConfigRepository>(
    RemoteConfigRepositoryImpl(remoteConfig: remoteConfig),
  );

  // Try to initialize the repository
  try {
    await locator<RemoteConfigRepository>().initialize();
    Print.green(
      'Repository initialized with update subscription',
      name: 'Remote Config',
    );
  } catch (e) {
    Print.red('Failed to initialize repository: $e', name: 'Remote Config');
  }
}
