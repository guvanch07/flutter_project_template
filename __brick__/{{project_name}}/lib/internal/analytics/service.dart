abstract class AnalyticsService {
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters});
  Future<void> setUserProperty(String name, String value);
  Future<void> setUserId(String? id);
}
