// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

part 'common_ui_data.freezed.dart';

@freezed
class CommonUiData with _$CommonUiData {
  CommonUiData._();
  factory CommonUiData({
    // required String defaultIso,
    // String? accountIso,
    // double? snackBarOffset,
    required CustomThemeData theme,
    // @Default([]) List<int> errorCodesToSkipInBaseInterceptor,
    // @Default({}) Map<int, LogOutType> errorCodesToLogOut,
    CustomButtonConfigWrapper? initialButtonsConfig,
  }) = _CommonUiData;

  CustomButtonConfigWrapper get buttonsConfig =>
      initialButtonsConfig ?? CustomButtonConfigWrapper.defaultConfigs();
}

@freezed
class GeneralTextData with _$GeneralTextData {
  const factory GeneralTextData({
    required String phoneFieldLabel,
    required String phoneCodeFieldLabel,
    required String baseValidationError,
    required String requiredFormFieldError,
    required String incorrectLoginError,
    required String cancelTitle,
    required String countryFieldTitle,
    required String actionClose,
    required String actionDone,
    required String actionEdit,
    required String actionDelete,
    required String actionRetry,
    required String exitScreenTitle,
    required String exitScreenMessage,
    required String exitScreenPrimaryButton,
    required String exitScreenSecondaryButton,
    required String baseErrorTitle,
    required String baseErrorMessage,
    required String dioErrorTitle,
    required String dioErrorMessage,
    required String emptyUserName,
    required String listIdleStatusTitle,
    required String listNoMoreStatusTitle,
    required String listCanLoadStatusTitle,
    required String listFailedStatusTitle,
    required String signUpAppleTitle,
    required String signUpFacebookTitle,
    required String signUpGoogleTitle,
    required String searchFieldHint,
    required String emptySearchTitle,
    required String searchResultsTitle,
  }) = _GeneralTextData;
}
