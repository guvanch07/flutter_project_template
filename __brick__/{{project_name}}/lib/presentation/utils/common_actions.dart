// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as inappwebview;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart' as launcher_string;

class CommonActions {
  static Future<void> launchBrowserUrl(
    String uri, {
    bool openNewTab = true,
  }) async {
    if (kIsWeb) {
      return launcher_string
          .launchUrlString(uri, webOnlyWindowName: openNewTab ? null : '_self')
          .then((_) => null);
    } else if (await isChromeSafariAvailable) {
      return inappwebview.ChromeSafariBrowser()
          .open(url: inappwebview.WebUri.uri(Uri.parse(uri)))
          .onError((error, stackTrace) {});
    } else {
      return inappwebview.InAppBrowser()
          .openUrlRequest(
            urlRequest: inappwebview.URLRequest(
              url: inappwebview.WebUri.uri(Uri.parse(uri)),
            ),
          )
          .onError((error, stackTrace) {});
    }
  }

  static Future<bool> get isChromeSafariAvailable =>
      inappwebview.ChromeSafariBrowser.isAvailable();

  static Future<void> share(
    BuildContext context,
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
    // pass the file path to share the file
    String? filePath,
  }) async {
    if (filePath != null) {
      final file = XFile(filePath);
      await Share.shareXFiles(
        [file],
        text: text,
        subject: subject,
        sharePositionOrigin: sharePositionOrigin,
      );
    } else {
      await Share.share(
        text,
        subject: subject,
        sharePositionOrigin: sharePositionOrigin,
      );
    }
  }
}
