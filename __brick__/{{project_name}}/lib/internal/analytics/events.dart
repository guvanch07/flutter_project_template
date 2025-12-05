part of 'service.dart';

class AnalyticsEventWrapper {
  final String name;
  final List<AnalyticsProvider> providers;

  const AnalyticsEventWrapper({
    required this.name,
    this.providers = AnalyticsProvider.values,
  });
}

class AnalyticsEvents {
  /// user successfully purchases subscription
  static const purchase = AnalyticsEventWrapper(
    name: 'af_purchase',
    providers: [
      AnalyticsProvider.appsflyer,
      AnalyticsProvider.firebase,
      AnalyticsProvider.smartlook,
      AnalyticsProvider.amplitude,
      AnalyticsProvider.facebook,
    ],
  );

  /// user starts free trial
  static const trialStarted = AnalyticsEventWrapper(
    name: 'trial_started',
    providers: [
      AnalyticsProvider.amplitude,
      AnalyticsProvider.appsflyer,
      AnalyticsProvider.firebase,
      AnalyticsProvider.smartlook,
      AnalyticsProvider.facebook,
    ],
  );

  /// app successfully recognizes artwork
  static const recognizeSuccess = AnalyticsEventWrapper(
    name: 'recognize_success',
    providers: [
      AnalyticsProvider.amplitude,
      AnalyticsProvider.smartlook,
      AnalyticsProvider.firebase,
      AnalyticsProvider.facebook,
    ],
  );

  /// user tries to recognize artwork again
  static const recognizeTryAgain = AnalyticsEventWrapper(
    name: 'recognize_try_again',
    providers: [
      AnalyticsProvider.amplitude,
      AnalyticsProvider.smartlook,
      AnalyticsProvider.firebase,
      AnalyticsProvider.facebook,
    ],
  );

  /// user gems is over
  static const gemsOver = AnalyticsEventWrapper(
    name: 'gems_over',
    providers: [
      AnalyticsProvider.amplitude,
      AnalyticsProvider.smartlook,
      AnalyticsProvider.firebase,
      AnalyticsProvider.facebook,
    ],
  );

  /// user clicks on listen description
  static const listenDescription = AnalyticsEventWrapper(
    name: 'listen_description',
    providers: [
      AnalyticsProvider.amplitude,
      AnalyticsProvider.smartlook,
      AnalyticsProvider.firebase,
      AnalyticsProvider.facebook,
    ],
  );

  /// user creates a new collection
  static const collectionCreated = AnalyticsEventWrapper(
    name: 'collection_created',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  /// user deletes a collection
  static const collectionDeleted = AnalyticsEventWrapper(
    name: 'collection_deleted',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  /// user edits a collection
  static const collectionEdited = AnalyticsEventWrapper(
    name: 'collection_edited',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const visualMatchesOpen = AnalyticsEventWrapper(
    name: 'visual_matches_open',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const ebayMatchesOpen = AnalyticsEventWrapper(
    name: 'ebay_matches_open',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const sharePdf = AnalyticsEventWrapper(
    name: 'share_pdf',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const shareLink = AnalyticsEventWrapper(
    name: 'share_link',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const shareTrophy = AnalyticsEventWrapper(
    name: 'share_trophy',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const collectionMoveTo = AnalyticsEventWrapper(
    name: 'collection_move_to',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const collectionAddTo = AnalyticsEventWrapper(
    name: 'collection_add_to',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const collectionRename = AnalyticsEventWrapper(
    name: 'collection_rename',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const collectionDelete = AnalyticsEventWrapper(
    name: 'collection_delete',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const collectionsSelector = AnalyticsEventWrapper(
    name: 'collections_selector',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const snapHistorySelector = AnalyticsEventWrapper(
    name: 'snap_history_selector',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const publishItem = AnalyticsEventWrapper(
    name: 'publish_item',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const unpublishItem = AnalyticsEventWrapper(
    name: 'unpublish_item',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const refineResult = AnalyticsEventWrapper(
    name: 'refine_result',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const deleteItem = AnalyticsEventWrapper(
    name: 'delete_item',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const onboarding = AnalyticsEventWrapper(
    name: 'onboarding',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const addItemClick = AnalyticsEventWrapper(
    name: 'add_item',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const editAntique = AnalyticsEventWrapper(
    name: 'edit_antique',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const contactDetails = AnalyticsEventWrapper(
    name: 'contact_details',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );

  static const search = AnalyticsEventWrapper(
    name: 'search',
    providers: [AnalyticsProvider.amplitude, AnalyticsProvider.firebase],
  );
}
