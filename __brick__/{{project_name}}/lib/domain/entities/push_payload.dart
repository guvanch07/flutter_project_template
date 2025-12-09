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
