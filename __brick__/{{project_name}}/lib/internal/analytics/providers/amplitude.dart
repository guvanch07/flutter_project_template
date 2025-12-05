import 'package:{{project_name}}/internal/analytics/service.dart';

class AmplitudeAnalyticsProvider implements AnalyticsService {
  @override
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    // TODO: Implement Amplitude
  }

  @override
  Future<void> setUserProperty(String name, String value) async {
    // TODO: Implement Amplitude
  }

  @override
  Future<void> setUserId(String? id) async {
    // TODO: Implement Amplitude
  }
}
