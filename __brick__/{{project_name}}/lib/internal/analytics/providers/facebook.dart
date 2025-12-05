// import 'package:facebook_app_events/facebook_app_events.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get_it/get_it.dart';
// import 'package:palestine_console/palestine_console.dart';

// Future<void> initFacebookAnalytics({
//   required GetIt locator,
// }) async {
//   // Check if already registered
//   if (locator.isRegistered<FacebookAppEvents>()) {
//     Print.red('already initialized', name: 'Facebook analytics');
//     return;
//   }

//   try {
//     if (!kIsWeb) {
//       final _facebookAppEvents = FacebookAppEvents();
//       locator.registerSingleton<FacebookAppEvents>(_facebookAppEvents);
//       Print.red('initialized', name: 'Facebook analytics');
//     }
//   } catch (e) {
//     Print.red('$e', name: 'Facebook');
//     // TODO: add Sentry
//     // unawaited(Sentry.captureMessage('Facebook init error: $e'));
//   }
// }
