// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:convert';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

/// Utilities for device-specific operations
class DeviceUtil {
  static Future<String> getAndroidId() async {
    final id = await const AndroidId().getId();
    return id ?? '';
  }

  /// Checks if the app is running on a simulator/emulator
  static bool get isSimulator {
    if (kIsWeb) return false;

    if (Platform.isIOS) {
      // Apple simulators typically have specific model identifiers
      return Platform.environment.containsKey('SIMULATOR_DEVICE_NAME') ||
          Platform.environment.containsKey('SIMULATOR_HOST_HOME');
    } else if (Platform.isAndroid) {
      // Check for Android emulator
      return !kReleaseMode &&
          (Platform.environment.containsKey('ANDROID_EMULATOR') ||
              Platform.environment.containsKey('ANDROID_SDK_ROOT'));
    }

    return false;
  }

  static Future<String> getStableDeviceId() async {
    final info = await DeviceInfoPlugin().androidInfo;

    final androidId = await const AndroidId().getId();

    final rawId = '$androidId-${info.model}-${info.manufacturer}';
    final bytes = utf8.encode(rawId);
    final hash = sha256.convert(bytes).toString();

    return hash;
  }
}
