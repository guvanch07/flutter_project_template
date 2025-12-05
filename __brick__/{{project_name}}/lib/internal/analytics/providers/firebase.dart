import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

Future<void> initFirebaseAnalytics({
  required AppEnv appEnv,
  required GetIt locator,
}) async {
  // Check if already registered
  if (locator.isRegistered<FirebaseAnalytics>()) {
    Print.red('already initialized', name: 'Firebase analytics');
    return;
  }

  try {
    final _firebaseAnalytics = FirebaseAnalytics.instance;
    await _firebaseAnalytics.setUserProperty(
      name: 'app_env',
      value: appEnv.name,
    );
    locator.registerSingleton<FirebaseAnalytics>(_firebaseAnalytics);
    Print.red('initialized', name: 'Firebase analytics');
  } catch (e) {
    Print.red('$e', name: 'Firebase');
    // TODO: add Sentry
    // unawaited(Sentry.captureMessage('Firebase init error: $e'));
  }
}
