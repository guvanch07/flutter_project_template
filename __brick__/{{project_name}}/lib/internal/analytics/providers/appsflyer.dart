import 'dart:async';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> appsflyerInit({
  required String apiKey,
  required String appId,
  required AppEnv appEnv,
  required GetIt locator,
}) async {
  // Check if already registered
  if (locator.isRegistered<AppsflyerSdk>()) {
    Print.red('already initialized', name: 'Appsflyer');
    return;
  }

  AppsflyerSdk? _appsflyer;
  try {
    if (!kIsWeb && appEnv == AppEnv.prod) {
      final appsFlyerOptions = AppsFlyerOptions(
        afDevKey: apiKey,
        appId: appId,
        showDebug: appEnv == AppEnv.dev,
        timeToWaitForATTUserAuthorization: 120,
        disableAdvertisingIdentifier: false,
        disableCollectASA: false,
        manualStart: true,
      );
      _appsflyer = AppsflyerSdk(appsFlyerOptions);

      await _appsflyer.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true,
      );
      _appsflyer.startSDK(
        onError: (errorCode, errorMessage) => Print.red(
          'startSDK error: $errorCode-$errorCode',
          name: 'appsflyerSdk',
        ),
        onSuccess: () => Print.green('startSDK success', name: 'appsflyerSdk'),
      );
      locator.registerSingleton<AppsflyerSdk>(_appsflyer);
      final appsflyerId = await _appsflyer.getAppsFlyerUID();
      if (appsflyerId != null) unawaited(Purchases.setAppsflyerID(appsflyerId));
    }
  } catch (e) {
    Print.red('$e', name: 'Appsflyer');
    // TODO: add Sentry
    // unawaited(Sentry.captureMessage('Appsflyer init error: $e'));
  }
}
