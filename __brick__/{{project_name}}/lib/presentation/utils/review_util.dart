// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:universal_io/io.dart';
import 'package:{{project_name}}/generated/translations.g.dart';

/// Utility class for managing native review request operations
class ReviewUtil {
  static const MethodChannel _channel = MethodChannel(
    '{{project_name}}.app/review',
  );

  /// Shows a review request dialog (Material modal on Android, native on iOS)
  /// Returns true if user tapped "Sure!" button, false if "Next Time", null on error
  static Future<bool?> showReviewRequest(BuildContext context) async {
    if (Platform.isAndroid) {
      final result = await showDialog<bool>(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          title: Text(t.reviewModal.title),
          content: Text(t.reviewModal.message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: Text(t.reviewModal.nextTimeText),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: Text(t.reviewModal.sureText),
            ),
          ],
        ),
      );
      if (result ?? false) return await _initAndroidReview();

      return result;
    } else if (Platform.isIOS) {
      try {
        final arguments = <String, String>{
          'title': t.reviewModal.title,
          'message': t.reviewModal.message,
          'nextTimeText': t.reviewModal.nextTimeText,
          'sureText': t.reviewModal.sureText,
        };

        final result = await _channel.invokeMethod<bool>(
          'showReviewRequest',
          arguments,
        );
        return result;
      } on PlatformException catch (e) {
        debugPrint('Failed to show review request: ${e.message}');
        return null;
      }
    }
    return null; // Fallback for unsupported platforms
  }
}

Future<bool> _initAndroidReview() async {
  final inAppReview = InAppReview.instance;
  if (await inAppReview.isAvailable()) {
    await inAppReview.requestReview();
    return true;
  }
  return false;
}
