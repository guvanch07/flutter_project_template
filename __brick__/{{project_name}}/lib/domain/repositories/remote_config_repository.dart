import 'dart:async';

abstract class Remote ConfigRepository {
  Future<void> initialize();
  
  /// Stream of configuration updates
  Stream<void> get configUpdates;
  
  // Add your remote config getters here
  // Example:
  // bool isFeatureEnabled();
  // String getApiUrl();
}
