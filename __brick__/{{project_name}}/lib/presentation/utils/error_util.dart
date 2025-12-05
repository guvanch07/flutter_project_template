// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/utils/utils.dart';
import 'package:{{project_name}}/generated/translations.g.dart';
import 'package:{{project_name}}/presentation/utils/utils.dart';

/// Utility for handling error interactions and displaying appropriate UI
class ErrorUtil {
  /// Maps a failure to its respective icon, title, and description
  static ErrorDisplayData mapFailureToErrorDisplay(
    BuildContext context,
    BaseFailure failure,
  ) => switch (failure) {
    // Connection error
    NoInternetConnectionFailure() => ErrorDisplayData(
      icon: SvgPicture.asset(
        'assets/svg/no_connection.svg',
        colorFilter: ColorFilter.mode(context.colors.error, BlendMode.srcIn),
      ),
      iconAsset: 'assets/images/error/no_connection.png',
      title: context.t.exceptions.connection.title,
      description: context.t.exceptions.connection.description,
    ),
    TimeoutFailure() => ErrorDisplayData(
      icon: SvgPicture.asset(
        'assets/svg/no_connection.svg',
        colorFilter: ColorFilter.mode(context.colors.error, BlendMode.srcIn),
      ),
      iconAsset: 'assets/images/error/no_connection.png',
      title: context.t.exceptions.connection.title,
      description: context.t.exceptions.connection.description,
    ),

    // Dio error with specific handling
    DioFailure() => _handleDioFailureDisplay(context, failure),

    // Storage error
    StorageFailure() => ErrorDisplayData(
      icon: SvgPicture.asset(
        'assets/svg/unknown_error.svg',
        colorFilter: ColorFilter.mode(context.colors.error, BlendMode.srcIn),
      ),
      iconAsset: 'assets/images/error/unknown_error.png',
      title: context.t.exceptions.unknown.title,
      description: context.t.exceptions.unknown.description,
    ),

    // Default error (any other type)
    _ => ErrorDisplayData(
      icon: SvgPicture.asset(
        'assets/svg/unknown_error.svg',
        colorFilter: ColorFilter.mode(context.colors.error, BlendMode.srcIn),
      ),
      iconAsset: 'assets/images/error/unknown_error.png',
      title: context.t.exceptions.unknown.title,
      description: context.t.exceptions.unknown.description,
    ),
  };

  /// Helper method to handle DioFailure display data
  static ErrorDisplayData _handleDioFailureDisplay(
    BuildContext context,
    DioFailure failure,
  ) {
    if (failure.error.error is SocketException) {
      return ErrorDisplayData(
        icon: SvgPicture.asset(
          'assets/svg/no_connection.svg',
          colorFilter: ColorFilter.mode(context.colors.error, BlendMode.srcIn),
        ),
        iconAsset: 'assets/images/error/no_connection.png',
        title: context.t.exceptions.connection.title,
        description: context.t.exceptions.connection.description,
      );
    }
    return switch (failure.error.type) {
      // Connection errors
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError => ErrorDisplayData(
        icon: SvgPicture.asset(
          'assets/svg/no_connection.svg',
          colorFilter: ColorFilter.mode(context.colors.error, BlendMode.srcIn),
        ),
        iconAsset: 'assets/images/error/no_connection.png',
        title: context.t.exceptions.connection.title,
        description: context.t.exceptions.connection.description,
      ),

      // Any other DioException type
      _ => ErrorDisplayData(
        icon: SvgPicture.asset(
          'assets/svg/unknown_error.svg',
          colorFilter: ColorFilter.mode(context.colors.error, BlendMode.srcIn),
        ),
        iconAsset: 'assets/images/error/unknown_error.png',
        title: context.t.exceptions.unknown.title,
        description: context.t.exceptions.unknown.description,
      ),
    };
  }

  /// Shows error bottom sheet with appropriate styling and actions
  static Future<void> showErrorBottomSheet({
    required BuildContext context,
    required BaseFailure failure,
    required VoidCallback onTryAgain,
    VoidCallback? onDismiss,
  }) async {
    final errorData = mapFailureToErrorDisplay(context, failure);

    await DialogUtils.showErrorBottomSheet(
      context: context,
      onTryAgain: onTryAgain,
      errorData: errorData,
    );
  }

  /// Shows error bottom sheet accepting any error object and maps it to BaseFailure
  static Future<void> showErrorBottomSheetForObject({
    required BuildContext context,
    required Object error,
    required VoidCallback onTryAgain,
    VoidCallback? onDismiss,
  }) async {
    // Use the data layer exception utility
    final mappedFailure = ExceptionUtil.toDomainFailure(error);
    return showErrorBottomSheet(
      context: context,
      failure: mappedFailure,
      onTryAgain: onTryAgain,
      onDismiss: onDismiss,
    );
  }
}

/// Data class for storing error display information
class ErrorDisplayData {
  final Widget? icon;
  final String iconAsset;
  final String title;
  final String description;

  const ErrorDisplayData({
    this.icon,
    required this.iconAsset,
    required this.title,
    required this.description,
  });
}
