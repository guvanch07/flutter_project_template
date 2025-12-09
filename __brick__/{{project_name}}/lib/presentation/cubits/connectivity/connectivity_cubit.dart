import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/presentation/utils/connectivity_service.dart';

enum ConnectivityStatus { connected, disconnected, unknown }

class ConnectivityCubit extends Cubit<ConnectivityStatus> {
  final ConnectivityService _connectivityService;
  StreamSubscription<bool>? _connectivitySubscription;

  ConnectivityCubit({required ConnectivityService connectivityService})
    : _connectivityService = connectivityService,
      super(ConnectivityStatus.unknown);

  /// Initialize connectivity monitoring
  Future<void> initialize() async {
    // Listen to connectivity changes
    _connectivitySubscription = _connectivityService.connectivityStream.listen((
      isConnected,
    ) {
      emit(
        isConnected
            ? ConnectivityStatus.connected
            : ConnectivityStatus.disconnected,
      );
    });

    // Emit initial state
    final isConnected = _connectivityService.isConnected;
    emit(
      isConnected
          ? ConnectivityStatus.connected
          : ConnectivityStatus.disconnected,
    );
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
