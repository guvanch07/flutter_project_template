import 'dart:async';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
//import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartlook/flutter_smartlook.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/injection.dart' as di;
import 'package:{{project_name}}/internal/analytics/custom_firebase_analytics_observer.dart';
import 'package:{{project_name}}/presentation/blocs/blocs.dart';
import 'package:universal_html/js.dart' as js;

part 'events.dart';

enum AnalyticsProvider { firebase, amplitude, smartlook, appsflyer, facebook }

abstract class AnalyticsService {
  void logScreenView({required String? name});

  void logEvent(AnalyticsEventWrapper event, {Map<String, Object>? parameters});

  Future<void> identify({
    required String uuid,
    required String email,
    AnalyticsCallOptions? callOptions,
  });

  List<NavigatorObserver> getRouteObservers();

  Future<void>? setUserProperty({required String name, required String value});
}

class AnalyticsServiceImpl extends AnalyticsService {
  final AppEnv _appEnv;
  final FirebaseAnalytics? _firebaseAnalytics;
  final Amplitude? _amplitude;
  final Smartlook? _smartlook;
  final AppsflyerSdk? _appsflyer;
  //final FacebookAppEvents? _facebookAppEvents;
  AnalyticsLoggerCubit get _analyticsLoggerCubit =>
      di.locator<AnalyticsLoggerCubit>();

  AnalyticsServiceImpl({
    required AppEnv appEnv,
    required FirebaseAnalytics? firebaseAnalytics,
    required Amplitude? amplitude,
    required Smartlook? smartlook,
    required AppsflyerSdk? appsflyer,
    //required FacebookAppEvents? facebookAppEvents,
  }) : _appEnv = appEnv,
       _firebaseAnalytics = firebaseAnalytics,
       _amplitude = amplitude,
       _smartlook = smartlook,
       _appsflyer = appsflyer;
  //_facebookAppEvents = facebookAppEvents;

  @override
  void logScreenView({required String? name}) {
    final normalized = name?.replaceFirst('/', '');

    if (normalized != null) {
      _smartlook?.trackNavigationEnter(normalized);
    }

    if (AppConstants.env == AppEnv.dev) {
      if (kDebugMode) {
        Print.yellow('logScreenView: $normalized', name: 'AnalyticsService');
      }
      _analyticsLoggerCubit.addItem(
        AnalyticsLogItem.logScreenView(
          date: DateTime.now(),
          name: normalized ?? 'empty',
        ),
      );
    }

    _firebaseAnalytics?.logScreenView(screenName: normalized);
  }

  @override
  void logEvent(
    AnalyticsEventWrapper event, {
    Map<String, Object>? parameters,
  }) {
    if (kDebugMode) {
      Print.yellow(
        '${event.name}. ${event.providers.map((e) => e.name)} params: $parameters',
        name: 'AnalyticsService',
      );
    }
    if (AppConstants.env == AppEnv.dev) {
      _analyticsLoggerCubit.addItem(
        AnalyticsLogItem.logEvent(
          date: DateTime.now(),
          event: event,
          parameters: parameters,
        ),
      );
    }
    if (event.providers.contains(AnalyticsProvider.firebase)) {
      _firebaseAnalytics?.logEvent(name: event.name, parameters: parameters);
    }
    if (event.providers.contains(AnalyticsProvider.amplitude)) {
      try {
        _amplitude?.track(BaseEvent(event.name, eventProperties: parameters));
      } catch (e) {
        Print.red('$e', name: 'AnalyticsService');
      }
    }
    if (event.providers.contains(AnalyticsProvider.appsflyer)) {
      _appsflyer?.logEvent(event.name, parameters);
    }
    if (event.providers.contains(AnalyticsProvider.smartlook)) {
      final properties = Properties();
      if (parameters != null) {
        parameters.forEach((key, value) {
          properties.putString(key, value: value.toString());
        });
      }
      _smartlook?.trackEvent(event.name, properties: properties);
    }
    if (event.providers.contains(AnalyticsProvider.facebook)) {
      //_facebookAppEvents?.logEvent(name: event.name, parameters: parameters);
    }
  }

  @override
  Future<void> identify({
    required String uuid,
    required String email,
    AnalyticsCallOptions? callOptions,
  }) async {
    if (AppConstants.env == AppEnv.dev) {
      unawaited(
        _analyticsLoggerCubit.addItem(
          AnalyticsLogItem.identify(
            date: DateTime.now(),
            uuid: uuid,
            email: email,
          ),
        ),
      );
    }
    //unawaited(_facebookAppEvents?.setUserID(uuid));
    if (kIsWeb && _appEnv == AppEnv.prod) {
      try {
        js.context.callMethod('identifySmartlook', [uuid, email]);
      } catch (e) {
        Print.red('$e', name: 'AnalyticsService');
      }
    } else {
      unawaited(_smartlook?.user.setIdentifier(uuid));
      unawaited(_smartlook?.user.setEmail(email));
    }
    try {
      await _amplitude?.setUserId(uuid);
    } catch (e) {
      Print.red('$e', name: 'AnalyticsService');
    }
    _appsflyer?.setCustomerUserId(uuid);
    // TODO: add Sentry
    // Sentry.configureScope(
    //   (scope) => scope.setUser(SentryUser(
    //     id: uuid,
    //     data: {
    //       'email': email,
    //       'flavor': InvoicesAppConstants.flavor.name,
    //     },
    //   )),
    // );
    return _firebaseAnalytics?.setUserId(id: uuid, callOptions: callOptions);
  }

  @override
  List<NavigatorObserver> getRouteObservers() => [
    CustomFirebaseAnalyticsObserver(),
    if (!kIsWeb) SmartlookObserver(),
  ];

  @override
  Future<void>? setUserProperty({
    required String name,
    required String value,
  }) => _firebaseAnalytics?.setUserProperty(name: name, value: value);
}
