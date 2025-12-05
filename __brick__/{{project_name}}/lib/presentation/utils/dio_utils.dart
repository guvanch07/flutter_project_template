import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:logger/logger.dart';

class PrettyFormatterData {
  final bool includeRequestHeaders;
  final bool includeRequestBody;
  final bool includeResponseBody;
  final bool includeResponseHeaders;

  const PrettyFormatterData({
    this.includeRequestHeaders = false,
    this.includeRequestBody = true,
    this.includeResponseBody = true,
    this.includeResponseHeaders = false,
  });
}

extension DioUtils on Dio {
  static HttpFormatter prettyFormatter({
    PrettyFormatterData data = const PrettyFormatterData(),
  }) =>
      HttpFormatter(
        includeRequestHeaders: data.includeRequestHeaders,
        includeRequestBody: data.includeRequestBody,
        includeResponseBody: data.includeResponseBody,
        includeResponseHeaders: data.includeResponseHeaders,
        logger: Logger(
          printer: PrettyPrinter(
            methodCount: 0,
            colors: true,
            dateTimeFormat: DateTimeFormat.none,
            printEmojis: false,
          ),
        ),
        loggingFilter: (request, response, error) => true,
      );

  Dio withDefaultOptions() {
    // TODO: add appVersion
    // final _appVersion =
    // 'v$appVersion.$buildNumber${featureName.isNotNullOrBlank ? " f:$featureName" : ""}';
    final options = BaseOptions(
      validateStatus: (status) => (status ?? 500) < 500,
      receiveTimeout: const Duration(minutes: 2),
      connectTimeout: const Duration(seconds: 60),
      headers: {
        'Accept': 'application/json',
        // 'App-Version': _appVersion,
        // 'Authorization': 'Bearer $appToken',
      },
    );

    return this..options = options;
  }
}
