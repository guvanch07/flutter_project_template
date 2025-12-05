import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

/// Service for monitoring internet connectivity
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  final StreamController<bool> _connectivityController =
      StreamController<bool>.broadcast();

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  /// Stream of connectivity changes
  Stream<bool> get connectivityStream => _connectivityController.stream;

  /// Initialize connectivity service
  Future<void> initialize() async {
    // Check initial connectivity
    unawaited(_checkConnectivity());

    // Listen for connectivity changes
    _subscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {
        final wasConnected = _isConnected;
        _isConnected =
            results.isNotEmpty && results.first != ConnectivityResult.none;

        if (wasConnected != _isConnected) {
          _connectivityController.add(_isConnected);
          if (kDebugMode) {
            print('Connectivity changed: $_isConnected');
          }
        }
      },
    );
  }

  /// Check current connectivity status
  Future<bool> checkConnectivity() async {
    try {
      final connectivityResults = await _connectivity.checkConnectivity();

      // If no connectivity, return false
      if (connectivityResults.contains(ConnectivityResult.none)) {
        return false;
      }

      // If connected, verify with actual internet access
      return await _hasInternetAccess();
    } catch (e) {
      if (kDebugMode) {
        print('Connectivity check error: $e');
      }
      return false;
    }
  }

  /// Internal method to check connectivity and update state
  Future<void> _checkConnectivity() async {
    final wasConnected = _isConnected;
    _isConnected = await checkConnectivity();

    if (wasConnected != _isConnected) {
      _connectivityController.add(_isConnected);
      if (kDebugMode) {
        print('Connectivity changed: $_isConnected');
      }
    }
  }

  /// Verify actual internet access by attempting to connect to a reliable host
  Future<bool> _hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Internet access check error: $e');
      }
      return false;
    }
  }

  /// Wait for internet connection with timeout
  Future<bool> waitForConnection(
      {Duration timeout = const Duration(seconds: 30)}) async {
    if (_isConnected) return true;

    final completer = Completer<bool>();
    late StreamSubscription<bool> subscription;

    subscription = connectivityStream.listen((isConnected) {
      if (isConnected) {
        subscription.cancel();
        completer.complete(true);
      }
    });

    // Set timeout
    Timer(timeout, () {
      if (!completer.isCompleted) {
        subscription.cancel();
        completer.complete(false);
      }
    });

    return completer.future;
  }

  /// Dispose resources
  void dispose() {
    _subscription?.cancel();
    _connectivityController.close();
  }
}
