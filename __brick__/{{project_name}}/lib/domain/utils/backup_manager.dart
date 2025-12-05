// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/services.dart';

class AppBackupManager {
  static const _channel = MethodChannel('{{project_name}}.app/back_up_manager');

  /// Notify the system that the data has changed
  static Future<bool> dataChanged() async {
    try {
      await _channel.invokeMethod('dataChanged');
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }
}
