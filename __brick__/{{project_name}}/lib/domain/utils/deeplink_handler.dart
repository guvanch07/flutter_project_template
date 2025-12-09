import 'package:flutter/foundation.dart';
import 'package:{{project_name}}/internal/config/app_constants.dart';

class DeeplinkHandler {
  static void fromString(String value) {
    final uri = Uri.tryParse(value);
    if (uri != null) {
      fromUri(uri);
    }
  }

  static void fromUri(Uri uri) {
    if (uri.scheme == AppConstants.deeplinkScheme && !kIsWeb) {
      // TODO: Handle deep link
      debugPrint('Deep link received: $uri');
    }
  }
}
