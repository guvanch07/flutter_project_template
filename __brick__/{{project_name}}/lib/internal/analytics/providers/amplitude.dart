import 'dart:async';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/identify.dart';
import 'package:get_it/get_it.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> amplitudeInit({
  required String? apiKey,
  required AppEnv appEnv,
  required GetIt locator,
}) async {
  if (apiKey == null) {
    Print.red('apiKey is null', name: 'Amplitude');
    return;
  }
  // Check if already registered
  if (locator.isRegistered<Amplitude>()) {
    Print.red('already initialized', name: 'Amplitude');
    return;
  }

  Amplitude? _amplitude;
  try {
    _amplitude = Amplitude(
      Configuration(
        apiKey: apiKey,
        // defaultTracking: DefaultTrackingOptions(),
      ),
    );

    await _amplitude.isBuilt;

    locator.registerSingleton<Amplitude>(_amplitude);
    final amplitudeDeviceId = await _amplitude.getDeviceId();
    final amplitudeUserId = await _amplitude.getUserId();
    unawaited(
      Purchases.setAttributes({
        if (amplitudeDeviceId != null) 'amplitudeDeviceId': amplitudeDeviceId,
        if (amplitudeUserId != null) 'amplitudeUserId': amplitudeUserId,
      }),
    );
    Print.red('initialized', name: 'Amplitude');
  } catch (e) {
    Print.red('$e', name: 'Amplitude');
    // TODO: add Sentry
    // unawaited(Sentry.captureMessage('Amplitude init error: $e'));
  }
  // core_di.locator<Dio>().interceptors.add(AmplitudeSessionIdInterceptor(
  //       amplitude: _amplitude,
  //       sid: sessionStartTimestamp,
  //     ));
  // core_di.locator<Dio>().addAppDeviceInterceptor(core_di.locator());
  try {
    unawaited(_amplitude?.identify(Identify()..set('app_env', appEnv.name)));
  } catch (e) {
    Print.red('$e', name: 'Amplitude');
  }
}
