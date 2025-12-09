// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/data/repositories/remote_config_repository_impl.dart';
import 'package:{{project_name}}/domain/repositories/remote_config_repository.dart';

Future<void> initRemoteConfig({required GetIt locator}) async {
  // Check if already registered
  if (locator.isRegistered<RemoteConfigRepository>()) {
    debugPrint('[RemoteConfigRepository] already initialized');
    return;
  }

  FirebaseRemoteConfig? remoteConfig;

  try {
    remoteConfig = FirebaseRemoteConfig.instance;
    locator.registerSingleton<FirebaseRemoteConfig>(remoteConfig);
    debugPrint('[Remote Config] Firebase Remote Config registered');
  } catch (e) {
    debugPrint(
      '[Remote Config] Failed to initialize Firebase Remote Config: $e',
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
    debugPrint(
      '[Remote Config] Repository initialized with update subscription',
    );
  } catch (e) {
    debugPrint('[Remote Config] Failed to initialize repository: $e');
  }
}
