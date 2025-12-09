// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/internal/config/app_env.dart';

Future<void> initFirebaseAnalytics({
  required AppEnv appEnv,
  required GetIt locator,
}) async {
  // Check if already registered
  if (locator.isRegistered<FirebaseAnalytics>()) {
    debugPrint('[Firebase analytics] already initialized');
    return;
  }

  try {
    final firebaseAnalytics = FirebaseAnalytics.instance;
    await firebaseAnalytics.setUserProperty(
      name: 'app_env',
      value: appEnv.name,
    );
    locator.registerSingleton<FirebaseAnalytics>(firebaseAnalytics);
    debugPrint('[Firebase analytics] initialized');
  } catch (e) {
    debugPrint('[Firebase] $e');
  }
}
