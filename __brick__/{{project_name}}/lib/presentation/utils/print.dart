// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/foundation.dart';

class Print {
  static void green(String message, {String? name}) {
    if (kDebugMode) {
      debugPrint('\x1B[32m${name != null ? "[$name] " : ""}$message\x1B[0m');
    }
  }

  static void yellow(String message, {String? name}) {
    if (kDebugMode) {
      debugPrint('\x1B[33m${name != null ? "[$name] " : ""}$message\x1B[0m');
    }
  }

  static void red(String message, {String? name}) {
    if (kDebugMode) {
      debugPrint('\x1B[31m${name != null ? "[$name] " : ""}$message\x1B[0m');
    }
  }
}
