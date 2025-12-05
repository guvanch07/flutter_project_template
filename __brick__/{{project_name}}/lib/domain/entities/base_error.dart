import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_error.freezed.dart';
part 'base_error.g.dart';

@freezed
class BaseError with _$BaseError {
  const BaseError._();
  const factory BaseError({
    required String message,
    required int code,
    String? key,
    Map<String, InternalError>? errors,
  }) = _BaseError;

  factory BaseError.fromJson(Map<String, Object?> json) =>
      _$BaseErrorFromJson(json);

  // ignore: prefer_expression_function_bodies
  String get getMessage {
    if (errors?.isNotEmpty ?? false) {
      final errorKey = errors!.keys.toList().firstOrNull;
      if (errorKey != null) {
        // TODO: add all translated
        // data = t.exceptions.configUpdate[errorKey];
        return '[$errorKey] ${errors![errorKey]!.message}';
      }
    }
    return message;
  }
}

@freezed
class InternalError with _$InternalError {
  const factory InternalError({
    required String key,
    @Default('') String message,
    @Default({}) Map<String, dynamic> params,
  }) = _InternalError;

  factory InternalError.fromJson(Map<String, Object?> json) =>
      _$InternalErrorFromJson(json);
}
