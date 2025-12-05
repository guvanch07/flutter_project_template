import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartlook/flutter_smartlook.dart';
import 'package:get_it/get_it.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

Future<void> smartlookInit({
  required String apiKey,
  required AppEnv appEnv,
  required GetIt locator,
}) async {
  // Check if already registered
  if (locator.isRegistered<Smartlook>()) {
    Print.red('already initialized', name: 'Smartlook');
    return;
  }

  try {
    if (!kIsWeb) {
      final _smartlook = Smartlook.instance;
      if (appEnv != AppEnv.dev) {
        await _smartlook.start();
      }
      await _smartlook.preferences.setProjectKey(apiKey);
      await _smartlook.preferences.setRenderingMode(
        appEnv == AppEnv.dev
            ? RenderingMode.no_rendering
            : RenderingMode.native,
      );
      _smartlook.sensitivity.changeWidgetClassSensitivity(
        classType: TextField,
        isSensitive: false,
      );
      _smartlook.sensitivity.changeWidgetClassSensitivity(
        classType: TextFormField,
        isSensitive: false,
      );
      // TODO: add custom password field widget
      // _smartlook.sensitivity.changeWidgetClassSensitivity(
      //   classType: CustomPasswordFieldWidget,
      //   isSensitive: true,
      // );
      locator.registerSingleton<Smartlook>(_smartlook);
    } else {
      throw UnimplementedError('Smartlook is unimplemented on web');
      // if (appEnv == AppEnv.prod) {
      //   try {
      //     js.context
      //         .callMethod('initSmartlook', [apiKey]);
      //   } catch (e) {}
      // }
    }
  } catch (e) {
    Print.red('$e', name: 'Smartlook');
    // TODO: add Sentry
    // unawaited(Sentry.captureMessage('Smartlook init error: $e'));
  }
}
