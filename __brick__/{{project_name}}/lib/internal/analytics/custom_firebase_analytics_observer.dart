import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/injection.dart' as di;
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
      di.locator<AnalyticsLoggerCubit>();

  void _sendScreenView(Route<dynamic> route) {
    final screenName = nameExtractor(route.settings);
    if (screenName != null && di.locator.isRegistered<FirebaseAnalytics>()) {
      if (AppConstants.env == AppEnv.dev) {
        _analyticsLoggerCubit.addItem(
          AnalyticsLogItem.routeObserver(
            date: DateTime.now(),
            name: screenName,
          ),
        );
      }
      di
          .locator<FirebaseAnalytics>()
          .logScreenView(screenName: screenName)
          .catchError((Object error) {
            final _onError = this._onError;
            if (_onError == null) {
              debugPrint('$FirebaseAnalyticsObserver: $error');
            } else {
              _onError(error as PlatformException);
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
