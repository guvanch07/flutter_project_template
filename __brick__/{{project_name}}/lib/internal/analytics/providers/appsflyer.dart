

import 'dart:async';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/internal/config/app_env.dart';

Future<void> appsflyerInit({
  required String apiKey,
  required String appId,
  required AppEnv appEnv,
  required GetIt locator,
}) async {
  // Check if already registered
  if (locator.isRegistered<AppsflyerSdk>()) {
    debugPrint('[Appsflyer] already initialized');
    return;
  }

  AppsflyerSdk? appsflyer;
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
      appsflyer = AppsflyerSdk(appsFlyerOptions);

      await appsflyer.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true,
      );
      appsflyer.startSDK(
        onError: (errorCode, errorMessage) =>
            debugPrint('[appsflyerSdk] startSDK error: $errorCode-$errorCode'),
        onSuccess: () => debugPrint('[appsflyerSdk] startSDK success'),
      );
      locator.registerSingleton<AppsflyerSdk>(appsflyer);
    }
  } catch (e) {
    debugPrint('[Appsflyer] $e');
  }
}
