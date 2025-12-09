// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:{{project_name}}/domain/repositories/remote_config_repository.dart';

class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  final FirebaseRemoteConfig? _remoteConfig;
  StreamSubscription? _configUpdateSubscription;
  final StreamController<void> _configUpdatesController =
      StreamController<void>.broadcast();

  RemoteConfigRepositoryImpl({FirebaseRemoteConfig? remoteConfig})
    : _remoteConfig = remoteConfig ?? FirebaseRemoteConfig.instance;

  static const String _autoCaptureEnabledKey = 'auto_capture_enabled';
  static const String _displayPaywallOnAppOpenKey =
      'display_paywall_on_app_open';
  static const String _appTutorialUrlKey = 'app_tutorial_url';
  static const String _shareUrlKey = 'app_share_url';
  static const String _appFeedLinkTypeKey = 'app_feed_link_type';
  static const String _appOnboardingNewKey = 'app_onboarding_new';
  static const String _appAlternativeStorageKey = 'app_is_alternative_storage';
  static const String _appEditAvailableKey = 'app_is_edit_available';
  static const String _appFeedAvailableKey = 'app_is_feed_available';
  static const String _appProfileAvailableKey = 'app_is_profile_available';
  static const String _appTrophyAvailableKey = 'app_is_trophy_available';

  @override
  Future<void> initialize() async {
    if (_remoteConfig == null) {
      debugPrint('Remote Config is null, using defaults');
      return;
    }

    try {
      await _remoteConfig!.setDefaults(const {
        _autoCaptureEnabledKey: false,
        _displayPaywallOnAppOpenKey: false,
      });
      await _remoteConfig!.fetchAndActivate();

      // Start listening for updates after successful initialization
      _startListeningForUpdates();
    } catch (e) {
      debugPrint('Remote Config error: $e');
    }
  }

  @override
  bool isAutoCaptureEnabled() {
    if (_remoteConfig == null) {
      return false;
    }
    return _remoteConfig!.getBool(_autoCaptureEnabledKey);
  }

  @override
  bool isDisplayPaywallOnAppOpen() {
    if (_remoteConfig == null) {
      return false;
    }
    return _remoteConfig!.getBool(_displayPaywallOnAppOpenKey);
  }

  @override
  String? getAppTutorialUrl() {
    if (_remoteConfig == null) {
      return null;
    }
    final url = _remoteConfig!.getString(_appTutorialUrlKey);
    return url.isNotEmpty ? url : null;
  }

  @override
  Stream<void> get configUpdates => _configUpdatesController.stream;

  void _startListeningForUpdates() {
    if (_remoteConfig == null) {
      debugPrint('Cannot start listening - Remote Config is null');
      return;
    }

    // Cancel existing subscription if any
    _configUpdateSubscription?.cancel();

    _configUpdateSubscription = _remoteConfig!.onConfigUpdated.listen(
      (event) async {
        try {
          debugPrint('Config updated, activating new values');
          await _remoteConfig!.activate();

          // Emit update event to notify listeners
          _configUpdatesController.add(null);
        } catch (e) {
          debugPrint('Failed to activate updated config: $e');
        }
      },
      onError: (error) {
        debugPrint('Config update error: $error');
      },
    );

    debugPrint('Started listening for config updates');
  }

  @override
  String? getTrophyShareUrl() {
    if (_remoteConfig == null) {
      return null;
    }
    final url = _remoteConfig!.getString(_shareUrlKey);
    return url.isNotEmpty ? url : null;
  }

  @override
  String? getAppFeedLinkType() {
    if (_remoteConfig == null) {
      return null;
    }
    final url = _remoteConfig!.getString(_appFeedLinkTypeKey);
    return url.isNotEmpty ? url : null;
  }

  @override
  bool isNewOnboarding() {
    if (_remoteConfig == null) {
      return false;
    }
    return _remoteConfig!.getBool(_appOnboardingNewKey);
  }

  @override
  bool isAlternativeStorage() {
    if (_remoteConfig == null) {
      return false;
    }
    // TODO: Add environment check properly
    // return _remoteConfig!.getBool(
    //   AppConstants.env == AppEnv.prod
    //       ? _appAlternativeStorageKey
    //       : _appAlternativeStorageDevKey,
    // );
    return _remoteConfig!.getBool(_appAlternativeStorageKey);
  }

  @override
  bool isEditAvailable() {
    if (_remoteConfig == null) {
      return true;
    }
    return _remoteConfig!.getBool(_appEditAvailableKey);
  }

  @override
  bool isFeedAvailable() {
    if (_remoteConfig == null) {
      return true;
    }
    return _remoteConfig!.getBool(_appFeedAvailableKey);
  }

  @override
  bool isProfileAvailable() {
    if (_remoteConfig == null) {
      return true;
    }
    return _remoteConfig!.getBool(_appProfileAvailableKey);
  }

  @override
  bool isTrophyAvailable() {
    if (_remoteConfig == null) {
      return true;
    }
    return _remoteConfig!.getBool(_appTrophyAvailableKey);
  }
}
