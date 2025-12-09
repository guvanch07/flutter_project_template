// ignore_for_file: avoid_classes_with_only_static_members

// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, unused_element

import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/injection.dart' as di;
import 'package:{{project_name}}/internal/analytics/service.dart';
import 'package:{{project_name}}/presentation/widgets/widgets.dart';

class ShareUtil {
  static Future<void> generatePdf({
    required BuildContext context,
    required CardDetailsEntity item,
    required String shareType,
  }) async {
    di.locator<AnalyticsService>().logEvent(
      AnalyticsEvents.sharePdf,
      parameters: {'type': shareType},
    );
    try {
      CustomLoadingWrapperWidget.instance().show(context: context);
      // final imagePath = '${context.appDirPath}/${item.fileName}';
      //TODO: Implement PDF generation
      // final pdfBytes = await PdfUtil.generatePdf(
      //   context: context,
      //   details: item.details,
      //   imagePath: imagePath,
      //   fileName: item.fileName,
      //   imageUrl: item.remoteImageUrl,
      // );
      // final safeAbout = _sanitizeFileName(item.details.about);
      // final pdfName = '${TravelAppConstants.appName} - $safeAbout.pdf';

      // await Printing.sharePdf(
      //   bytes: pdfBytes,
      //   filename: pdfName,
      //   bounds: _getSharePosition(context, null),
      // );
      CustomLoadingWrapperWidget.instance().hide();
    } catch (e) {
      CustomLoadingWrapperWidget.instance().hide();
      debugPrint('Error generating PDF: $e');
      unawaited(
        FirebaseCrashlytics.instance.recordError(e, StackTrace.current),
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate PDF: $e'),
            backgroundColor: context.colors.error,
          ),
        );
      }
    }
  }

  static String _sanitizeFileName(String name) {
    final replaced = name.replaceAll(RegExp(r'[\\/:*?"<>|]'), '-');
    return replaced.replaceAll(RegExp('-{2,}'), '-').trim();
  }

  static Rect? _getSharePosition(
    BuildContext context,
    Rect? sharePositionOrigin,
  ) {
    final box = context.findRenderObject() as RenderBox?;
    final screenSize = MediaQuery.of(context).size;

    var positionOrigin = sharePositionOrigin;
    if (positionOrigin == null && box != null) {
      final rawRect = box.localToGlobal(Offset.zero) & box.size;

      // Ensure the rect is within screen bounds
      var left = rawRect.left;
      var top = rawRect.top;
      var width = rawRect.width;
      var height = rawRect.height;

      // Clamp left coordinate
      if (left < 0) left = 0;
      if (left + width > screenSize.width) {
        left = screenSize.width - width;
        if (left < 0) {
          left = 0;
          width = screenSize.width;
        }
      }

      // Clamp top coordinate
      if (top < 0) top = 0;
      if (top + height > screenSize.height) {
        top = screenSize.height - height;
        if (top < 0) {
          top = 0;
          height = screenSize.height;
        }
      }

      positionOrigin = Rect.fromLTWH(left, top, width, height);
    }

    return positionOrigin;
  }
}
