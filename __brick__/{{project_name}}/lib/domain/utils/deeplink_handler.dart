// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:superwallkit_flutter/superwallkit_flutter.dart';

class DeeplinkHandler {
  static void fromString(String value) {
    final uri = Uri.tryParse(value);
    if (uri != null) {
      fromUri(uri);
    }
  }

  static void fromUri(Uri uri) {
    if (uri.scheme == AppConstants.deeplinkScheme && !kIsWeb) {
      unawaited(Superwall.shared.handleDeepLink(uri));
    }
  }
}
