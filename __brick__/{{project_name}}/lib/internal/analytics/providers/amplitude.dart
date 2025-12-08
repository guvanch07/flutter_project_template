import 'dart:async';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/identify.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/internal/config/app_env.dart';

Future<void> amplitudeInit({
  required String? apiKey,
  required AppEnv appEnv,
  required GetIt locator,
}) async {
  if (apiKey == null) {
    debugPrint('[Amplitude] apiKey is null');
    return;
  }
  // Check if already registered
  if (locator.isRegistered<Amplitude>()) {
    debugPrint('[Amplitude] already initialized');
    return;
  }

  Amplitude? amplitude;
  try {
    amplitude = Amplitude(Configuration(apiKey: apiKey));

    await amplitude.isBuilt;

    locator.registerSingleton<Amplitude>(amplitude);
    debugPrint('[Amplitude] initialized');
  } catch (e) {
    debugPrint('[Amplitude] $e');
  }
  try {
    unawaited(amplitude?.identify(Identify()..set('app_env', appEnv.name)));
  } catch (e) {
    debugPrint('[Amplitude] $e');
  }
}
