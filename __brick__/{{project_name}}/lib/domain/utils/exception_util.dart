// ignore_for_file: avoid_classes_with_only_static_members, prefer_expression_function_bodies

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

/// Utility for mapping exceptions from data layer to domain failures
class ExceptionUtil {
  /// Maps any exception to a domain-specific BaseFailure
  static BaseFailure toDomainFailure(Object error) {
    // Use switch expression for cleaner error mapping
    return switch (error) {
      // Connection errors
      SocketException() => const NoInternetConnectionFailure(),

      // Timeout errors
      TimeoutException() => const TimeoutFailure(),

      // Dio errors with specialized handling
      DioException() => _handleDioException(error),

      // Already a BaseFailure
      BaseFailure() => error,

      // Handle cases where the error string contains known patterns
      Object() when error.toString().contains('SocketException') =>
        const NoInternetConnectionFailure(),
      Object() when error.toString().contains('TimeoutException') =>
        const TimeoutFailure(),

      // Default fallback
      _ => UnknownFailure(error.toString()),
    };
  }

  /// Helper method to handle Dio exceptions with more detailed mapping
  static BaseFailure _handleDioException(DioException error) =>
      switch (error.type) {
        DioExceptionType.connectionTimeout => const TimeoutFailure(),
        DioExceptionType.sendTimeout => const TimeoutFailure(),
        DioExceptionType.receiveTimeout => const TimeoutFailure(),
        DioExceptionType.connectionError => const NoInternetConnectionFailure(),
        _ => DioFailure(error),
      };
}
