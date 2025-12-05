import 'dart:async';

import 'package:flutter/foundation.dart';

/// Utility class for logging method execution times
class TimingLogger {
  static final TimingLogger _instance = TimingLogger._internal();
  factory TimingLogger() => _instance;
  TimingLogger._internal();

  final Map<String, int> _timings = {};
  final StreamController<Map<String, int>> _timingsController =
      StreamController<Map<String, int>>.broadcast();

  /// Stream of timing updates
  Stream<Map<String, int>> get timingsStream => _timingsController.stream;

  /// Get current timings
  Map<String, int> get timings => Map.from(_timings);

  /// Clear all timings
  void clearTimings() {
    _timings.clear();
    _timingsController.add(Map.from(_timings));
  }

  /// Measure execution time of a synchronous method
  T measureSync<T>(String methodName, T Function() method) {
    final stopwatch = Stopwatch()..start();

    try {
      final result = method();
      return result;
    } finally {
      stopwatch.stop();
      _recordTiming(methodName, stopwatch.elapsedMilliseconds);
    }
  }

  /// Measure execution time of an asynchronous method
  Future<T> measureAsync<T>(
      String methodName, Future<T> Function() method) async {
    final stopwatch = Stopwatch()..start();

    try {
      final result = await method();
      return result;
    } finally {
      stopwatch.stop();
      _recordTiming(methodName, stopwatch.elapsedMilliseconds);
    }
  }

  /// Record timing for a method
  void _recordTiming(String methodName, int milliseconds) {
    _timings[methodName] = milliseconds;
    _timingsController.add(Map.from(_timings));

    if (kDebugMode) {
      print('⏱️ $methodName took ${milliseconds}ms');
    }
  }

  /// Dispose the timing logger
  void dispose() {
    _timingsController.close();
  }
}
