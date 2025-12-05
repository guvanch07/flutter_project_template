// ignore_for_file: avoid_classes_with_only_static_members

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/generated/translations.g.dart';
import 'package:{{project_name}}/presentation/utils/utils.dart';
import 'package:universal_io/io.dart';

class PermissionsUtil {
  static Future<bool> camera(BuildContext context) async {
    if (Platform.isAndroid) {
      if (await Permission.camera.isPermanentlyDenied) {
        await _showMissingCameraPermissionDialog(context);
        return false;
      } else {
        final status = await Permission.camera.request();
        return status.isGranted;
      }
    } else {
      if (await Permission.camera.isPermanentlyDenied) {
        await _showMissingCameraPermissionDialog(context);
        return false;
      } else {
        final status = await Permission.camera.request();
        return status.isGranted;
      }
    }
  }

  /// Запрашивает разрешение на отслеживание (ATT) и ожидает результат.
  /// Если результат отрицательный на первой попытке, повторно запрашивает через 2 секунды.
  /// Возвращает окончательный статус разрешения.
  static Future<TrackingStatus> requestAppTracking() async {
    try {
      // Получаем текущий статус разрешения
      final initialStatus =
          await AppTrackingTransparency.trackingAuthorizationStatus;
      Print.green(
        'Initial tracking status: $initialStatus',
        name: 'AppTracking',
      );

      // Если статус уже определен, возвращаем его
      if (initialStatus != TrackingStatus.notDetermined) {
        return initialStatus;
      }

      // Первая попытка запроса
      Print.green(
        'Requesting tracking authorization (first attempt)',
        name: 'AppTracking',
      );
      var status = await AppTrackingTransparency.requestTrackingAuthorization();
      Print.green('First attempt result: $status', name: 'AppTracking');

      // Проверяем статус в цикле, так как в некоторых версиях iOS
      // функция возвращает denied до того, как пользователь ответил
      var attempts = 0;
      while (status == TrackingStatus.denied &&
          await AppTrackingTransparency.trackingAuthorizationStatus ==
              TrackingStatus.notDetermined &&
          attempts < 4) {
        Print.yellow('Dialog status mismatch, waiting...', name: 'AppTracking');
        await Future.delayed(const Duration(milliseconds: 500));
        attempts++;
      }

      // Если статус все еще не определен, ждем 2 секунды и пробуем снова
      final currentStatus =
          await AppTrackingTransparency.trackingAuthorizationStatus;
      if (currentStatus == TrackingStatus.notDetermined) {
        Print.yellow(
          'Status still not determined, trying again after delay',
          name: 'AppTracking',
        );
        await Future.delayed(const Duration(seconds: 2));

        // Вторая попытка запроса
        Print.green(
          'Requesting tracking authorization (second attempt)',
          name: 'AppTracking',
        );
        status = await AppTrackingTransparency.requestTrackingAuthorization();
        Print.green('Second attempt result: $status', name: 'AppTracking');

        // Снова проверяем в цикле
        attempts = 0;
        while (status == TrackingStatus.denied &&
            await AppTrackingTransparency.trackingAuthorizationStatus ==
                TrackingStatus.notDetermined &&
            attempts < 4) {
          Print.yellow(
            'Dialog status mismatch on second attempt, waiting...',
            name: 'AppTracking',
          );
          await Future.delayed(const Duration(milliseconds: 500));
          attempts++;
        }
      }

      // Получаем окончательный статус
      final finalStatus =
          await AppTrackingTransparency.trackingAuthorizationStatus;
      Print.green('Final tracking status: $finalStatus', name: 'AppTracking');
      return finalStatus;
    } catch (e) {
      Print.red(
        'Error requesting tracking permission: $e',
        name: 'AppTracking',
      );
      return TrackingStatus.denied;
    }
  }

  static Future<void> _showMissingCameraPermissionDialog(
    BuildContext context,
  ) => DialogUtils.showAlertMessage<bool>(
    context: context,
    title: context.t.cameraPermissionModal.title,
    message: context.t.cameraPermissionModal.description,
    primaryButtonText: context.t.cameraPermissionModal.primaryButton,
    onPrimaryButtonTap: (context) => openAppSettings(),
    secondaryButtonText: context.t.cameraPermissionModal.secondaryButton,
    alertType: DialogAlertType.primary,
    borderRadius: CustomCorner.medium,
  );
}
