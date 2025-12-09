// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name}}/injection.dart';
import 'package:{{project_name}}/internal/config/app_constants.dart';
import 'package:{{project_name}}/internal/config/app_env.dart';
import 'package:{{project_name}}/presentation/blocs/blocs.dart';

class CustomFirebaseAnalyticsObserver
    extends RouteObserver<ModalRoute<dynamic>> {
  CustomFirebaseAnalyticsObserver({
    this.nameExtractor = defaultNameExtractor,
    this.routeFilter = defaultRouteFilter,
    Function(PlatformException error)? onError,
  }) : _onError = onError;

  final ScreenNameExtractor nameExtractor;
  final RouteFilter routeFilter;
  final void Function(PlatformException error)? _onError;

  AnalyticsLoggerCubit get _analyticsLoggerCubit =>
      getIt<AnalyticsLoggerCubit>();

  void _sendScreenView(Route<dynamic> route) {
    final screenName = nameExtractor(route.settings);
    if (screenName != null && getIt.isRegistered<FirebaseAnalytics>()) {
      if (AppConstants.env == AppEnv.dev) {
        _analyticsLoggerCubit.addItem(
          AnalyticsLogItem.logScreenView(
            date: DateTime.now(),
            name: screenName,
          ),
        );
      }
      getIt<FirebaseAnalytics>()
          .logScreenView(screenName: screenName)
          .catchError((Object error) {
            final onError = _onError;
            if (onError == null) {
              debugPrint('$FirebaseAnalyticsObserver: $error');
            } else {
              onError(error as PlatformException);
            }
          }, test: (Object error) => error is PlatformException);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (routeFilter(route)) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null && routeFilter(newRoute)) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null &&
        routeFilter(previousRoute) &&
        routeFilter(route)) {
      _sendScreenView(previousRoute);
    }
  }
}
