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
  Color get opacitySecondary => withOpacity(CustomOpacity.secondary);

  /// 0.38
  Color get opacityDisable => withOpacity(CustomOpacity.disable);

  /// 0.38
  Color get opacityHint => withOpacity(CustomOpacity.hint);

  /// 0.12
  Color get opacityDividers => withOpacity(CustomOpacity.dividers);

  /// 0.12
  Color get opacity$12 => withOpacity(CustomOpacity.$12);

  /// 0.16
  Color get opacity$16 => withOpacity(CustomOpacity.$16);

  /// 0.08
  Color get opacity$8 => withOpacity(CustomOpacity.$8);
}

extension TextStyleOpacityExtension on TextStyle? {
  /// 0.6
  TextStyle? get opacitySecondary => this?.copyWith(
        color: this?.color?.withOpacity(CustomOpacity.secondary),
      );

  /// 0.38
  TextStyle? get opacityDisable => this?.copyWith(
        color: this?.color?.withOpacity(CustomOpacity.disable),
      );

  /// 0.38
  TextStyle? get opacityHint => this?.copyWith(
        color: this?.color?.withOpacity(CustomOpacity.hint),
      );

  /// 0.12
  TextStyle? get opacityDividers => this?.copyWith(
        color: this?.color?.withOpacity(CustomOpacity.dividers),
      );

  /// 0.12
  TextStyle? get opacity$12 => this?.copyWith(
        color: this?.color?.withOpacity(CustomOpacity.$12),
      );

  /// 0.16
  TextStyle? get opacity$16 => this?.copyWith(
        color: this?.color?.withOpacity(CustomOpacity.$16),
      );

  /// 0.08
  TextStyle? get opacity$8 => this?.copyWith(
        color: this?.color?.withOpacity(CustomOpacity.$8),
      );
}
