// ignore_for_file: uri_does_not_exist, uri_has_not_been_generated, undefined_class, undefined_identifier, undefined_annotation_member, invalid_annotation_target, not_a_type, undefined_method

import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_payload.freezed.dart';
part 'push_payload.g.dart';

/// Payload for push notifications
@freezed
class PushPayload with _$PushPayload {
  const factory PushPayload({
    String? type,
    String? instance,
    String? id,
    Map<String, dynamic>? data,
  }) = _PushPayload;

  factory PushPayload.fromJson(Map<String, dynamic> json) =>
      _$PushPayloadFromJson(json);
}
