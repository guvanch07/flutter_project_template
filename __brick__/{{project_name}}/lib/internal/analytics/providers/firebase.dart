import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:{{project_name}}/internal/analytics/service.dart';

class FirebaseAnalyticsProvider implements AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  @override
  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  @override
  Future<void> setUserId(String? id) async {
    await _analytics.setUserId(id: id);
  }
}
