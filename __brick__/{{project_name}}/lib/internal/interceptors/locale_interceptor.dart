// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:dio/dio.dart';
import 'package:{{project_name}}/data/preferences_key.dart';
import 'package:{{project_name}}/domain/repositories/repositories.dart';
import 'package:{{project_name}}/i18n/strings.g.dart';
import 'package:{{project_name}}/injection.dart';
import 'package:{{project_name}}/internal/config/config.dart';

class LocaleInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final preferencesRepository = locator<PreferencesRepository>();
      final locale =
          await preferencesRepository.read(PreferencesKey.appLocale) ??
          AppLocale.en;
      final baseUrl = AppConstants.tcgDexBaseUrl;
      final localeCode = locale.languageCode;

      // Replace the locale in the base URL
      final updatedBaseUrl = baseUrl.replaceFirst(
        RegExp(r'/[^/]+$'),
        '/$localeCode',
      );
      options.baseUrl = updatedBaseUrl;
    } catch (e) {
      // If there's an error reading locale, use default 'en'
      final baseUrl = AppConstants.tcgDexBaseUrl;
      options.baseUrl = baseUrl;
    }

    handler.next(options);
  }
}
