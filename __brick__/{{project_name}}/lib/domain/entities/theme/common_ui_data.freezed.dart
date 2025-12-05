// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_ui_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CommonUiData {
  // required String defaultIso,
  // String? accountIso,
  // double? snackBarOffset,
  CustomThemeData get theme =>
      throw _privateConstructorUsedError; // @Default([]) List<int> errorCodesToSkipInBaseInterceptor,
  // @Default({}) Map<int, LogOutType> errorCodesToLogOut,
  CustomButtonConfigWrapper? get initialButtonsConfig =>
      throw _privateConstructorUsedError;

  /// Create a copy of CommonUiData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonUiDataCopyWith<CommonUiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonUiDataCopyWith<$Res> {
  factory $CommonUiDataCopyWith(
    CommonUiData value,
    $Res Function(CommonUiData) then,
  ) = _$CommonUiDataCopyWithImpl<$Res, CommonUiData>;
  @useResult
  $Res call({
    CustomThemeData theme,
    CustomButtonConfigWrapper? initialButtonsConfig,
  });

  $CustomButtonConfigWrapperCopyWith<$Res>? get initialButtonsConfig;
}

/// @nodoc
class _$CommonUiDataCopyWithImpl<$Res, $Val extends CommonUiData>
    implements $CommonUiDataCopyWith<$Res> {
  _$CommonUiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonUiData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? theme = null, Object? initialButtonsConfig = freezed}) {
    return _then(
      _value.copyWith(
            theme: null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as CustomThemeData,
            initialButtonsConfig: freezed == initialButtonsConfig
                ? _value.initialButtonsConfig
                : initialButtonsConfig // ignore: cast_nullable_to_non_nullable
                      as CustomButtonConfigWrapper?,
          )
          as $Val,
    );
  }

  /// Create a copy of CommonUiData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomButtonConfigWrapperCopyWith<$Res>? get initialButtonsConfig {
    if (_value.initialButtonsConfig == null) {
      return null;
    }

    return $CustomButtonConfigWrapperCopyWith<$Res>(
      _value.initialButtonsConfig!,
      (value) {
        return _then(_value.copyWith(initialButtonsConfig: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$CommonUiDataImplCopyWith<$Res>
    implements $CommonUiDataCopyWith<$Res> {
  factory _$$CommonUiDataImplCopyWith(
    _$CommonUiDataImpl value,
    $Res Function(_$CommonUiDataImpl) then,
  ) = __$$CommonUiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CustomThemeData theme,
    CustomButtonConfigWrapper? initialButtonsConfig,
  });

  @override
  $CustomButtonConfigWrapperCopyWith<$Res>? get initialButtonsConfig;
}

/// @nodoc
class __$$CommonUiDataImplCopyWithImpl<$Res>
    extends _$CommonUiDataCopyWithImpl<$Res, _$CommonUiDataImpl>
    implements _$$CommonUiDataImplCopyWith<$Res> {
  __$$CommonUiDataImplCopyWithImpl(
    _$CommonUiDataImpl _value,
    $Res Function(_$CommonUiDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommonUiData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? theme = null, Object? initialButtonsConfig = freezed}) {
    return _then(
      _$CommonUiDataImpl(
        theme: null == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as CustomThemeData,
        initialButtonsConfig: freezed == initialButtonsConfig
            ? _value.initialButtonsConfig
            : initialButtonsConfig // ignore: cast_nullable_to_non_nullable
                  as CustomButtonConfigWrapper?,
      ),
    );
  }
}

/// @nodoc

class _$CommonUiDataImpl extends _CommonUiData {
  _$CommonUiDataImpl({required this.theme, this.initialButtonsConfig})
    : super._();

  // required String defaultIso,
  // String? accountIso,
  // double? snackBarOffset,
  @override
  final CustomThemeData theme;
  // @Default([]) List<int> errorCodesToSkipInBaseInterceptor,
  // @Default({}) Map<int, LogOutType> errorCodesToLogOut,
  @override
  final CustomButtonConfigWrapper? initialButtonsConfig;

  @override
  String toString() {
    return 'CommonUiData(theme: $theme, initialButtonsConfig: $initialButtonsConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonUiDataImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.initialButtonsConfig, initialButtonsConfig) ||
                other.initialButtonsConfig == initialButtonsConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme, initialButtonsConfig);

  /// Create a copy of CommonUiData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonUiDataImplCopyWith<_$CommonUiDataImpl> get copyWith =>
      __$$CommonUiDataImplCopyWithImpl<_$CommonUiDataImpl>(this, _$identity);
}

abstract class _CommonUiData extends CommonUiData {
  factory _CommonUiData({
    required final CustomThemeData theme,
    final CustomButtonConfigWrapper? initialButtonsConfig,
  }) = _$CommonUiDataImpl;
  _CommonUiData._() : super._();

  // required String defaultIso,
  // String? accountIso,
  // double? snackBarOffset,
  @override
  CustomThemeData get theme; // @Default([]) List<int> errorCodesToSkipInBaseInterceptor,
  // @Default({}) Map<int, LogOutType> errorCodesToLogOut,
  @override
  CustomButtonConfigWrapper? get initialButtonsConfig;

  /// Create a copy of CommonUiData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonUiDataImplCopyWith<_$CommonUiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GeneralTextData {
  String get phoneFieldLabel => throw _privateConstructorUsedError;
  String get phoneCodeFieldLabel => throw _privateConstructorUsedError;
  String get baseValidationError => throw _privateConstructorUsedError;
  String get requiredFormFieldError => throw _privateConstructorUsedError;
  String get incorrectLoginError => throw _privateConstructorUsedError;
  String get cancelTitle => throw _privateConstructorUsedError;
  String get countryFieldTitle => throw _privateConstructorUsedError;
  String get actionClose => throw _privateConstructorUsedError;
  String get actionDone => throw _privateConstructorUsedError;
  String get actionEdit => throw _privateConstructorUsedError;
  String get actionDelete => throw _privateConstructorUsedError;
  String get actionRetry => throw _privateConstructorUsedError;
  String get exitScreenTitle => throw _privateConstructorUsedError;
  String get exitScreenMessage => throw _privateConstructorUsedError;
  String get exitScreenPrimaryButton => throw _privateConstructorUsedError;
  String get exitScreenSecondaryButton => throw _privateConstructorUsedError;
  String get baseErrorTitle => throw _privateConstructorUsedError;
  String get baseErrorMessage => throw _privateConstructorUsedError;
  String get dioErrorTitle => throw _privateConstructorUsedError;
  String get dioErrorMessage => throw _privateConstructorUsedError;
  String get emptyUserName => throw _privateConstructorUsedError;
  String get listIdleStatusTitle => throw _privateConstructorUsedError;
  String get listNoMoreStatusTitle => throw _privateConstructorUsedError;
  String get listCanLoadStatusTitle => throw _privateConstructorUsedError;
  String get listFailedStatusTitle => throw _privateConstructorUsedError;
  String get signUpAppleTitle => throw _privateConstructorUsedError;
  String get signUpFacebookTitle => throw _privateConstructorUsedError;
  String get signUpGoogleTitle => throw _privateConstructorUsedError;
  String get searchFieldHint => throw _privateConstructorUsedError;
  String get emptySearchTitle => throw _privateConstructorUsedError;
  String get searchResultsTitle => throw _privateConstructorUsedError;

  /// Create a copy of GeneralTextData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralTextDataCopyWith<GeneralTextData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralTextDataCopyWith<$Res> {
  factory $GeneralTextDataCopyWith(
    GeneralTextData value,
    $Res Function(GeneralTextData) then,
  ) = _$GeneralTextDataCopyWithImpl<$Res, GeneralTextData>;
  @useResult
  $Res call({
    String phoneFieldLabel,
    String phoneCodeFieldLabel,
    String baseValidationError,
    String requiredFormFieldError,
    String incorrectLoginError,
    String cancelTitle,
    String countryFieldTitle,
    String actionClose,
    String actionDone,
    String actionEdit,
    String actionDelete,
    String actionRetry,
    String exitScreenTitle,
    String exitScreenMessage,
    String exitScreenPrimaryButton,
    String exitScreenSecondaryButton,
    String baseErrorTitle,
    String baseErrorMessage,
    String dioErrorTitle,
    String dioErrorMessage,
    String emptyUserName,
    String listIdleStatusTitle,
    String listNoMoreStatusTitle,
    String listCanLoadStatusTitle,
    String listFailedStatusTitle,
    String signUpAppleTitle,
    String signUpFacebookTitle,
    String signUpGoogleTitle,
    String searchFieldHint,
    String emptySearchTitle,
    String searchResultsTitle,
  });
}

/// @nodoc
class _$GeneralTextDataCopyWithImpl<$Res, $Val extends GeneralTextData>
    implements $GeneralTextDataCopyWith<$Res> {
  _$GeneralTextDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralTextData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneFieldLabel = null,
    Object? phoneCodeFieldLabel = null,
    Object? baseValidationError = null,
    Object? requiredFormFieldError = null,
    Object? incorrectLoginError = null,
    Object? cancelTitle = null,
    Object? countryFieldTitle = null,
    Object? actionClose = null,
    Object? actionDone = null,
    Object? actionEdit = null,
    Object? actionDelete = null,
    Object? actionRetry = null,
    Object? exitScreenTitle = null,
    Object? exitScreenMessage = null,
    Object? exitScreenPrimaryButton = null,
    Object? exitScreenSecondaryButton = null,
    Object? baseErrorTitle = null,
    Object? baseErrorMessage = null,
    Object? dioErrorTitle = null,
    Object? dioErrorMessage = null,
    Object? emptyUserName = null,
    Object? listIdleStatusTitle = null,
    Object? listNoMoreStatusTitle = null,
    Object? listCanLoadStatusTitle = null,
    Object? listFailedStatusTitle = null,
    Object? signUpAppleTitle = null,
    Object? signUpFacebookTitle = null,
    Object? signUpGoogleTitle = null,
    Object? searchFieldHint = null,
    Object? emptySearchTitle = null,
    Object? searchResultsTitle = null,
  }) {
    return _then(
      _value.copyWith(
            phoneFieldLabel: null == phoneFieldLabel
                ? _value.phoneFieldLabel
                : phoneFieldLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneCodeFieldLabel: null == phoneCodeFieldLabel
                ? _value.phoneCodeFieldLabel
                : phoneCodeFieldLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            baseValidationError: null == baseValidationError
                ? _value.baseValidationError
                : baseValidationError // ignore: cast_nullable_to_non_nullable
                      as String,
            requiredFormFieldError: null == requiredFormFieldError
                ? _value.requiredFormFieldError
                : requiredFormFieldError // ignore: cast_nullable_to_non_nullable
                      as String,
            incorrectLoginError: null == incorrectLoginError
                ? _value.incorrectLoginError
                : incorrectLoginError // ignore: cast_nullable_to_non_nullable
                      as String,
            cancelTitle: null == cancelTitle
                ? _value.cancelTitle
                : cancelTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            countryFieldTitle: null == countryFieldTitle
                ? _value.countryFieldTitle
                : countryFieldTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            actionClose: null == actionClose
                ? _value.actionClose
                : actionClose // ignore: cast_nullable_to_non_nullable
                      as String,
            actionDone: null == actionDone
                ? _value.actionDone
                : actionDone // ignore: cast_nullable_to_non_nullable
                      as String,
            actionEdit: null == actionEdit
                ? _value.actionEdit
                : actionEdit // ignore: cast_nullable_to_non_nullable
                      as String,
            actionDelete: null == actionDelete
                ? _value.actionDelete
                : actionDelete // ignore: cast_nullable_to_non_nullable
                      as String,
            actionRetry: null == actionRetry
                ? _value.actionRetry
                : actionRetry // ignore: cast_nullable_to_non_nullable
                      as String,
            exitScreenTitle: null == exitScreenTitle
                ? _value.exitScreenTitle
                : exitScreenTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            exitScreenMessage: null == exitScreenMessage
                ? _value.exitScreenMessage
                : exitScreenMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            exitScreenPrimaryButton: null == exitScreenPrimaryButton
                ? _value.exitScreenPrimaryButton
                : exitScreenPrimaryButton // ignore: cast_nullable_to_non_nullable
                      as String,
            exitScreenSecondaryButton: null == exitScreenSecondaryButton
                ? _value.exitScreenSecondaryButton
                : exitScreenSecondaryButton // ignore: cast_nullable_to_non_nullable
                      as String,
            baseErrorTitle: null == baseErrorTitle
                ? _value.baseErrorTitle
                : baseErrorTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            baseErrorMessage: null == baseErrorMessage
                ? _value.baseErrorMessage
                : baseErrorMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            dioErrorTitle: null == dioErrorTitle
                ? _value.dioErrorTitle
                : dioErrorTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            dioErrorMessage: null == dioErrorMessage
                ? _value.dioErrorMessage
                : dioErrorMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            emptyUserName: null == emptyUserName
                ? _value.emptyUserName
                : emptyUserName // ignore: cast_nullable_to_non_nullable
                      as String,
            listIdleStatusTitle: null == listIdleStatusTitle
                ? _value.listIdleStatusTitle
                : listIdleStatusTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            listNoMoreStatusTitle: null == listNoMoreStatusTitle
                ? _value.listNoMoreStatusTitle
                : listNoMoreStatusTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            listCanLoadStatusTitle: null == listCanLoadStatusTitle
                ? _value.listCanLoadStatusTitle
                : listCanLoadStatusTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            listFailedStatusTitle: null == listFailedStatusTitle
                ? _value.listFailedStatusTitle
                : listFailedStatusTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            signUpAppleTitle: null == signUpAppleTitle
                ? _value.signUpAppleTitle
                : signUpAppleTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            signUpFacebookTitle: null == signUpFacebookTitle
                ? _value.signUpFacebookTitle
                : signUpFacebookTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            signUpGoogleTitle: null == signUpGoogleTitle
                ? _value.signUpGoogleTitle
                : signUpGoogleTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            searchFieldHint: null == searchFieldHint
                ? _value.searchFieldHint
                : searchFieldHint // ignore: cast_nullable_to_non_nullable
                      as String,
            emptySearchTitle: null == emptySearchTitle
                ? _value.emptySearchTitle
                : emptySearchTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            searchResultsTitle: null == searchResultsTitle
                ? _value.searchResultsTitle
                : searchResultsTitle // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeneralTextDataImplCopyWith<$Res>
    implements $GeneralTextDataCopyWith<$Res> {
  factory _$$GeneralTextDataImplCopyWith(
    _$GeneralTextDataImpl value,
    $Res Function(_$GeneralTextDataImpl) then,
  ) = __$$GeneralTextDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String phoneFieldLabel,
    String phoneCodeFieldLabel,
    String baseValidationError,
    String requiredFormFieldError,
    String incorrectLoginError,
    String cancelTitle,
    String countryFieldTitle,
    String actionClose,
    String actionDone,
    String actionEdit,
    String actionDelete,
    String actionRetry,
    String exitScreenTitle,
    String exitScreenMessage,
    String exitScreenPrimaryButton,
    String exitScreenSecondaryButton,
    String baseErrorTitle,
    String baseErrorMessage,
    String dioErrorTitle,
    String dioErrorMessage,
    String emptyUserName,
    String listIdleStatusTitle,
    String listNoMoreStatusTitle,
    String listCanLoadStatusTitle,
    String listFailedStatusTitle,
    String signUpAppleTitle,
    String signUpFacebookTitle,
    String signUpGoogleTitle,
    String searchFieldHint,
    String emptySearchTitle,
    String searchResultsTitle,
  });
}

/// @nodoc
class __$$GeneralTextDataImplCopyWithImpl<$Res>
    extends _$GeneralTextDataCopyWithImpl<$Res, _$GeneralTextDataImpl>
    implements _$$GeneralTextDataImplCopyWith<$Res> {
  __$$GeneralTextDataImplCopyWithImpl(
    _$GeneralTextDataImpl _value,
    $Res Function(_$GeneralTextDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeneralTextData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneFieldLabel = null,
    Object? phoneCodeFieldLabel = null,
    Object? baseValidationError = null,
    Object? requiredFormFieldError = null,
    Object? incorrectLoginError = null,
    Object? cancelTitle = null,
    Object? countryFieldTitle = null,
    Object? actionClose = null,
    Object? actionDone = null,
    Object? actionEdit = null,
    Object? actionDelete = null,
    Object? actionRetry = null,
    Object? exitScreenTitle = null,
    Object? exitScreenMessage = null,
    Object? exitScreenPrimaryButton = null,
    Object? exitScreenSecondaryButton = null,
    Object? baseErrorTitle = null,
    Object? baseErrorMessage = null,
    Object? dioErrorTitle = null,
    Object? dioErrorMessage = null,
    Object? emptyUserName = null,
    Object? listIdleStatusTitle = null,
    Object? listNoMoreStatusTitle = null,
    Object? listCanLoadStatusTitle = null,
    Object? listFailedStatusTitle = null,
    Object? signUpAppleTitle = null,
    Object? signUpFacebookTitle = null,
    Object? signUpGoogleTitle = null,
    Object? searchFieldHint = null,
    Object? emptySearchTitle = null,
    Object? searchResultsTitle = null,
  }) {
    return _then(
      _$GeneralTextDataImpl(
        phoneFieldLabel: null == phoneFieldLabel
            ? _value.phoneFieldLabel
            : phoneFieldLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneCodeFieldLabel: null == phoneCodeFieldLabel
            ? _value.phoneCodeFieldLabel
            : phoneCodeFieldLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        baseValidationError: null == baseValidationError
            ? _value.baseValidationError
            : baseValidationError // ignore: cast_nullable_to_non_nullable
                  as String,
        requiredFormFieldError: null == requiredFormFieldError
            ? _value.requiredFormFieldError
            : requiredFormFieldError // ignore: cast_nullable_to_non_nullable
                  as String,
        incorrectLoginError: null == incorrectLoginError
            ? _value.incorrectLoginError
            : incorrectLoginError // ignore: cast_nullable_to_non_nullable
                  as String,
        cancelTitle: null == cancelTitle
            ? _value.cancelTitle
            : cancelTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        countryFieldTitle: null == countryFieldTitle
            ? _value.countryFieldTitle
            : countryFieldTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        actionClose: null == actionClose
            ? _value.actionClose
            : actionClose // ignore: cast_nullable_to_non_nullable
                  as String,
        actionDone: null == actionDone
            ? _value.actionDone
            : actionDone // ignore: cast_nullable_to_non_nullable
                  as String,
        actionEdit: null == actionEdit
            ? _value.actionEdit
            : actionEdit // ignore: cast_nullable_to_non_nullable
                  as String,
        actionDelete: null == actionDelete
            ? _value.actionDelete
            : actionDelete // ignore: cast_nullable_to_non_nullable
                  as String,
        actionRetry: null == actionRetry
            ? _value.actionRetry
            : actionRetry // ignore: cast_nullable_to_non_nullable
                  as String,
        exitScreenTitle: null == exitScreenTitle
            ? _value.exitScreenTitle
            : exitScreenTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        exitScreenMessage: null == exitScreenMessage
            ? _value.exitScreenMessage
            : exitScreenMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        exitScreenPrimaryButton: null == exitScreenPrimaryButton
            ? _value.exitScreenPrimaryButton
            : exitScreenPrimaryButton // ignore: cast_nullable_to_non_nullable
                  as String,
        exitScreenSecondaryButton: null == exitScreenSecondaryButton
            ? _value.exitScreenSecondaryButton
            : exitScreenSecondaryButton // ignore: cast_nullable_to_non_nullable
                  as String,
        baseErrorTitle: null == baseErrorTitle
            ? _value.baseErrorTitle
            : baseErrorTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        baseErrorMessage: null == baseErrorMessage
            ? _value.baseErrorMessage
            : baseErrorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        dioErrorTitle: null == dioErrorTitle
            ? _value.dioErrorTitle
            : dioErrorTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        dioErrorMessage: null == dioErrorMessage
            ? _value.dioErrorMessage
            : dioErrorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        emptyUserName: null == emptyUserName
            ? _value.emptyUserName
            : emptyUserName // ignore: cast_nullable_to_non_nullable
                  as String,
        listIdleStatusTitle: null == listIdleStatusTitle
            ? _value.listIdleStatusTitle
            : listIdleStatusTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        listNoMoreStatusTitle: null == listNoMoreStatusTitle
            ? _value.listNoMoreStatusTitle
            : listNoMoreStatusTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        listCanLoadStatusTitle: null == listCanLoadStatusTitle
            ? _value.listCanLoadStatusTitle
            : listCanLoadStatusTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        listFailedStatusTitle: null == listFailedStatusTitle
            ? _value.listFailedStatusTitle
            : listFailedStatusTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        signUpAppleTitle: null == signUpAppleTitle
            ? _value.signUpAppleTitle
            : signUpAppleTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        signUpFacebookTitle: null == signUpFacebookTitle
            ? _value.signUpFacebookTitle
            : signUpFacebookTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        signUpGoogleTitle: null == signUpGoogleTitle
            ? _value.signUpGoogleTitle
            : signUpGoogleTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        searchFieldHint: null == searchFieldHint
            ? _value.searchFieldHint
            : searchFieldHint // ignore: cast_nullable_to_non_nullable
                  as String,
        emptySearchTitle: null == emptySearchTitle
            ? _value.emptySearchTitle
            : emptySearchTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        searchResultsTitle: null == searchResultsTitle
            ? _value.searchResultsTitle
            : searchResultsTitle // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GeneralTextDataImpl implements _GeneralTextData {
  const _$GeneralTextDataImpl({
    required this.phoneFieldLabel,
    required this.phoneCodeFieldLabel,
    required this.baseValidationError,
    required this.requiredFormFieldError,
    required this.incorrectLoginError,
    required this.cancelTitle,
    required this.countryFieldTitle,
    required this.actionClose,
    required this.actionDone,
    required this.actionEdit,
    required this.actionDelete,
    required this.actionRetry,
    required this.exitScreenTitle,
    required this.exitScreenMessage,
    required this.exitScreenPrimaryButton,
    required this.exitScreenSecondaryButton,
    required this.baseErrorTitle,
    required this.baseErrorMessage,
    required this.dioErrorTitle,
    required this.dioErrorMessage,
    required this.emptyUserName,
    required this.listIdleStatusTitle,
    required this.listNoMoreStatusTitle,
    required this.listCanLoadStatusTitle,
    required this.listFailedStatusTitle,
    required this.signUpAppleTitle,
    required this.signUpFacebookTitle,
    required this.signUpGoogleTitle,
    required this.searchFieldHint,
    required this.emptySearchTitle,
    required this.searchResultsTitle,
  });

  @override
  final String phoneFieldLabel;
  @override
  final String phoneCodeFieldLabel;
  @override
  final String baseValidationError;
  @override
  final String requiredFormFieldError;
  @override
  final String incorrectLoginError;
  @override
  final String cancelTitle;
  @override
  final String countryFieldTitle;
  @override
  final String actionClose;
  @override
  final String actionDone;
  @override
  final String actionEdit;
  @override
  final String actionDelete;
  @override
  final String actionRetry;
  @override
  final String exitScreenTitle;
  @override
  final String exitScreenMessage;
  @override
  final String exitScreenPrimaryButton;
  @override
  final String exitScreenSecondaryButton;
  @override
  final String baseErrorTitle;
  @override
  final String baseErrorMessage;
  @override
  final String dioErrorTitle;
  @override
  final String dioErrorMessage;
  @override
  final String emptyUserName;
  @override
  final String listIdleStatusTitle;
  @override
  final String listNoMoreStatusTitle;
  @override
  final String listCanLoadStatusTitle;
  @override
  final String listFailedStatusTitle;
  @override
  final String signUpAppleTitle;
  @override
  final String signUpFacebookTitle;
  @override
  final String signUpGoogleTitle;
  @override
  final String searchFieldHint;
  @override
  final String emptySearchTitle;
  @override
  final String searchResultsTitle;

  @override
  String toString() {
    return 'GeneralTextData(phoneFieldLabel: $phoneFieldLabel, phoneCodeFieldLabel: $phoneCodeFieldLabel, baseValidationError: $baseValidationError, requiredFormFieldError: $requiredFormFieldError, incorrectLoginError: $incorrectLoginError, cancelTitle: $cancelTitle, countryFieldTitle: $countryFieldTitle, actionClose: $actionClose, actionDone: $actionDone, actionEdit: $actionEdit, actionDelete: $actionDelete, actionRetry: $actionRetry, exitScreenTitle: $exitScreenTitle, exitScreenMessage: $exitScreenMessage, exitScreenPrimaryButton: $exitScreenPrimaryButton, exitScreenSecondaryButton: $exitScreenSecondaryButton, baseErrorTitle: $baseErrorTitle, baseErrorMessage: $baseErrorMessage, dioErrorTitle: $dioErrorTitle, dioErrorMessage: $dioErrorMessage, emptyUserName: $emptyUserName, listIdleStatusTitle: $listIdleStatusTitle, listNoMoreStatusTitle: $listNoMoreStatusTitle, listCanLoadStatusTitle: $listCanLoadStatusTitle, listFailedStatusTitle: $listFailedStatusTitle, signUpAppleTitle: $signUpAppleTitle, signUpFacebookTitle: $signUpFacebookTitle, signUpGoogleTitle: $signUpGoogleTitle, searchFieldHint: $searchFieldHint, emptySearchTitle: $emptySearchTitle, searchResultsTitle: $searchResultsTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralTextDataImpl &&
            (identical(other.phoneFieldLabel, phoneFieldLabel) ||
                other.phoneFieldLabel == phoneFieldLabel) &&
            (identical(other.phoneCodeFieldLabel, phoneCodeFieldLabel) ||
                other.phoneCodeFieldLabel == phoneCodeFieldLabel) &&
            (identical(other.baseValidationError, baseValidationError) ||
                other.baseValidationError == baseValidationError) &&
            (identical(other.requiredFormFieldError, requiredFormFieldError) ||
                other.requiredFormFieldError == requiredFormFieldError) &&
            (identical(other.incorrectLoginError, incorrectLoginError) ||
                other.incorrectLoginError == incorrectLoginError) &&
            (identical(other.cancelTitle, cancelTitle) ||
                other.cancelTitle == cancelTitle) &&
            (identical(other.countryFieldTitle, countryFieldTitle) ||
                other.countryFieldTitle == countryFieldTitle) &&
            (identical(other.actionClose, actionClose) ||
                other.actionClose == actionClose) &&
            (identical(other.actionDone, actionDone) ||
                other.actionDone == actionDone) &&
            (identical(other.actionEdit, actionEdit) ||
                other.actionEdit == actionEdit) &&
            (identical(other.actionDelete, actionDelete) ||
                other.actionDelete == actionDelete) &&
            (identical(other.actionRetry, actionRetry) ||
                other.actionRetry == actionRetry) &&
            (identical(other.exitScreenTitle, exitScreenTitle) ||
                other.exitScreenTitle == exitScreenTitle) &&
            (identical(other.exitScreenMessage, exitScreenMessage) ||
                other.exitScreenMessage == exitScreenMessage) &&
            (identical(
                  other.exitScreenPrimaryButton,
                  exitScreenPrimaryButton,
                ) ||
                other.exitScreenPrimaryButton == exitScreenPrimaryButton) &&
            (identical(
                  other.exitScreenSecondaryButton,
                  exitScreenSecondaryButton,
                ) ||
                other.exitScreenSecondaryButton == exitScreenSecondaryButton) &&
            (identical(other.baseErrorTitle, baseErrorTitle) ||
                other.baseErrorTitle == baseErrorTitle) &&
            (identical(other.baseErrorMessage, baseErrorMessage) ||
                other.baseErrorMessage == baseErrorMessage) &&
            (identical(other.dioErrorTitle, dioErrorTitle) ||
                other.dioErrorTitle == dioErrorTitle) &&
            (identical(other.dioErrorMessage, dioErrorMessage) ||
                other.dioErrorMessage == dioErrorMessage) &&
            (identical(other.emptyUserName, emptyUserName) ||
                other.emptyUserName == emptyUserName) &&
            (identical(other.listIdleStatusTitle, listIdleStatusTitle) ||
                other.listIdleStatusTitle == listIdleStatusTitle) &&
            (identical(other.listNoMoreStatusTitle, listNoMoreStatusTitle) ||
                other.listNoMoreStatusTitle == listNoMoreStatusTitle) &&
            (identical(other.listCanLoadStatusTitle, listCanLoadStatusTitle) ||
                other.listCanLoadStatusTitle == listCanLoadStatusTitle) &&
            (identical(other.listFailedStatusTitle, listFailedStatusTitle) ||
                other.listFailedStatusTitle == listFailedStatusTitle) &&
            (identical(other.signUpAppleTitle, signUpAppleTitle) ||
                other.signUpAppleTitle == signUpAppleTitle) &&
            (identical(other.signUpFacebookTitle, signUpFacebookTitle) ||
                other.signUpFacebookTitle == signUpFacebookTitle) &&
            (identical(other.signUpGoogleTitle, signUpGoogleTitle) ||
                other.signUpGoogleTitle == signUpGoogleTitle) &&
            (identical(other.searchFieldHint, searchFieldHint) ||
                other.searchFieldHint == searchFieldHint) &&
            (identical(other.emptySearchTitle, emptySearchTitle) ||
                other.emptySearchTitle == emptySearchTitle) &&
            (identical(other.searchResultsTitle, searchResultsTitle) ||
                other.searchResultsTitle == searchResultsTitle));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    phoneFieldLabel,
    phoneCodeFieldLabel,
    baseValidationError,
    requiredFormFieldError,
    incorrectLoginError,
    cancelTitle,
    countryFieldTitle,
    actionClose,
    actionDone,
    actionEdit,
    actionDelete,
    actionRetry,
    exitScreenTitle,
    exitScreenMessage,
    exitScreenPrimaryButton,
    exitScreenSecondaryButton,
    baseErrorTitle,
    baseErrorMessage,
    dioErrorTitle,
    dioErrorMessage,
    emptyUserName,
    listIdleStatusTitle,
    listNoMoreStatusTitle,
    listCanLoadStatusTitle,
    listFailedStatusTitle,
    signUpAppleTitle,
    signUpFacebookTitle,
    signUpGoogleTitle,
    searchFieldHint,
    emptySearchTitle,
    searchResultsTitle,
  ]);

  /// Create a copy of GeneralTextData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralTextDataImplCopyWith<_$GeneralTextDataImpl> get copyWith =>
      __$$GeneralTextDataImplCopyWithImpl<_$GeneralTextDataImpl>(
        this,
        _$identity,
      );
}

abstract class _GeneralTextData implements GeneralTextData {
  const factory _GeneralTextData({
    required final String phoneFieldLabel,
    required final String phoneCodeFieldLabel,
    required final String baseValidationError,
    required final String requiredFormFieldError,
    required final String incorrectLoginError,
    required final String cancelTitle,
    required final String countryFieldTitle,
    required final String actionClose,
    required final String actionDone,
    required final String actionEdit,
    required final String actionDelete,
    required final String actionRetry,
    required final String exitScreenTitle,
    required final String exitScreenMessage,
    required final String exitScreenPrimaryButton,
    required final String exitScreenSecondaryButton,
    required final String baseErrorTitle,
    required final String baseErrorMessage,
    required final String dioErrorTitle,
    required final String dioErrorMessage,
    required final String emptyUserName,
    required final String listIdleStatusTitle,
    required final String listNoMoreStatusTitle,
    required final String listCanLoadStatusTitle,
    required final String listFailedStatusTitle,
    required final String signUpAppleTitle,
    required final String signUpFacebookTitle,
    required final String signUpGoogleTitle,
    required final String searchFieldHint,
    required final String emptySearchTitle,
    required final String searchResultsTitle,
  }) = _$GeneralTextDataImpl;

  @override
  String get phoneFieldLabel;
  @override
  String get phoneCodeFieldLabel;
  @override
  String get baseValidationError;
  @override
  String get requiredFormFieldError;
  @override
  String get incorrectLoginError;
  @override
  String get cancelTitle;
  @override
  String get countryFieldTitle;
  @override
  String get actionClose;
  @override
  String get actionDone;
  @override
  String get actionEdit;
  @override
  String get actionDelete;
  @override
  String get actionRetry;
  @override
  String get exitScreenTitle;
  @override
  String get exitScreenMessage;
  @override
  String get exitScreenPrimaryButton;
  @override
  String get exitScreenSecondaryButton;
  @override
  String get baseErrorTitle;
  @override
  String get baseErrorMessage;
  @override
  String get dioErrorTitle;
  @override
  String get dioErrorMessage;
  @override
  String get emptyUserName;
  @override
  String get listIdleStatusTitle;
  @override
  String get listNoMoreStatusTitle;
  @override
  String get listCanLoadStatusTitle;
  @override
  String get listFailedStatusTitle;
  @override
  String get signUpAppleTitle;
  @override
  String get signUpFacebookTitle;
  @override
  String get signUpGoogleTitle;
  @override
  String get searchFieldHint;
  @override
  String get emptySearchTitle;
  @override
  String get searchResultsTitle;

  /// Create a copy of GeneralTextData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralTextDataImplCopyWith<_$GeneralTextDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
