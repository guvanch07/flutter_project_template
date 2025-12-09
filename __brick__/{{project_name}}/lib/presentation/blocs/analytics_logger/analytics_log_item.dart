// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:{{project_name}}/internal/analytics/service.dart';

enum AnalyticsLogType { screenView, event, identify }

class AnalyticsLogItem {
  final DateTime date;
  final String? name;
  final AnalyticsEventWrapper? event;
  final Map<String, Object>? parameters;
  final String? uuid;
  final String? email;
  final AnalyticsLogType type;

  AnalyticsLogItem({
    required this.date,
    required this.type,
    this.name,
    this.event,
    this.parameters,
    this.uuid,
    this.email,
  });

  factory AnalyticsLogItem.logScreenView({
    required DateTime date,
    required String name,
  }) => AnalyticsLogItem(
    date: date,
    type: AnalyticsLogType.screenView,
    name: name,
  );

  factory AnalyticsLogItem.logEvent({
    required DateTime date,
    required AnalyticsEventWrapper event,
    Map<String, Object>? parameters,
  }) => AnalyticsLogItem(
    date: date,
    type: AnalyticsLogType.event,
    event: event,
    parameters: parameters,
  );

  factory AnalyticsLogItem.identify({
    required DateTime date,
    required String uuid,
    required String email,
  }) => AnalyticsLogItem(
    date: date,
    type: AnalyticsLogType.identify,
    uuid: uuid,
    email: email,
  );
}
