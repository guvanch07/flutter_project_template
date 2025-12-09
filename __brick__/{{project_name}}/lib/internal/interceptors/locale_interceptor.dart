import 'package:dio/dio.dart';
import 'package:{{project_name}}/data/preferences_key.dart';
import 'package:{{project_name}}/domain/repositories/repositories.dart';
import 'package:{{project_name}}/generated/translations.g.dart';
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
      final baseUrl = AppConstants.baseUrl;
      final localeCode = locale.languageCode;

      // Replace the locale in the base URL
      final updatedBaseUrl = baseUrl.replaceFirst(
        RegExp(r'/[^/]+$'),
        '/$localeCode',
      );
      options.baseUrl = updatedBaseUrl;
    } catch (e) {
      // If there's an error reading locale, use default 'en'
      final baseUrl = AppConstants.baseUrl;
      options.baseUrl = baseUrl;
    }

    handler.next(options);
  }
}
