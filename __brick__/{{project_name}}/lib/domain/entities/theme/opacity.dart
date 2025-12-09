// ignore_for_file: uri_does_not_exist, undefined_class

import 'package:flutter/widgets.dart';

class CustomOpacity {
  static const double secondary = .6;
  static const double disable = .38;
  static const double hint = .38;
  static const double dividers = .12;

  static const double $12 = .12;
  static const double $16 = .16;
  static const double $8 = .08;
}

extension ColorOpacityExtension on Color {
  /// 0.6
  Color get opacitySecondary => withValues(alpha: CustomOpacity.secondary);

  /// 0.38
  Color get opacityDisable => withValues(alpha: CustomOpacity.disable);

  /// 0.38
  Color get opacityHint => withValues(alpha: CustomOpacity.hint);

  /// 0.12
  Color get opacityDividers => withValues(alpha: CustomOpacity.dividers);

  /// 0.12
  Color get opacity$12 => withValues(alpha: CustomOpacity.$12);

  /// 0.16
  Color get opacity$16 => withValues(alpha: CustomOpacity.$16);

  /// 0.08
  Color get opacity$8 => withValues(alpha: CustomOpacity.$8);
}

extension TextStyleOpacityExtension on TextStyle? {
  /// 0.6
  TextStyle? get opacitySecondary => this?.copyWith(
    color: this?.color?.withValues(alpha: CustomOpacity.secondary),
  );

  /// 0.38
  TextStyle? get opacityDisable => this?.copyWith(
    color: this?.color?.withValues(alpha: CustomOpacity.disable),
  );

  /// 0.38
  TextStyle? get opacityHint =>
      this?.copyWith(color: this?.color?.withValues(alpha: CustomOpacity.hint));

  /// 0.12
  TextStyle? get opacityDividers => this?.copyWith(
    color: this?.color?.withValues(alpha: CustomOpacity.dividers),
  );

  /// 0.12
  TextStyle? get opacity$12 =>
      this?.copyWith(color: this?.color?.withValues(alpha: CustomOpacity.$12));

  /// 0.16
  TextStyle? get opacity$16 =>
      this?.copyWith(color: this?.color?.withValues(alpha: CustomOpacity.$16));

  /// 0.08
  TextStyle? get opacity$8 =>
      this?.copyWith(color: this?.color?.withValues(alpha: CustomOpacity.$8));
}
