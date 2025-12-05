import 'dart:async';

abstract class RemoteConfigRepository {
  Future<void> initialize();
  bool isAutoCaptureEnabled();
  bool isDisplayPaywallOnAppOpen();
  String? getAppTutorialUrl();
  String? getTrophyShareUrl();
  String? getAppFeedLinkType();

  /// decides whether to show the old onboarding or the new one
  bool isNewOnboarding();

  bool isAlternativeStorage();
  bool isEditAvailable();
  bool isFeedAvailable();
  bool isProfileAvailable();
  bool isTrophyAvailable();

  Stream<void> get configUpdates;
}
