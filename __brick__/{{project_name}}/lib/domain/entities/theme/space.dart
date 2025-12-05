import 'package:flutter/material.dart';

const double _spaceFactor = 4;

class CustomSpace {
  double get $1 => _spaceFactor;
  double get $2 => _spaceFactor * 2;
  double get $3 => _spaceFactor * 3;
  double get $4 => _spaceFactor * 4;
  double get $5 => _spaceFactor * 5;
  double get $6 => _spaceFactor * 6;
  double get $7 => _spaceFactor * 7;
  double get $8 => _spaceFactor * 8;
  double get $9 => _spaceFactor * 9;
  double get $10 => _spaceFactor * 10;
  double get $11 => _spaceFactor * 11;
  double get $12 => _spaceFactor * 12;
  double get $14 => _spaceFactor * 14;
  double get $16 => _spaceFactor * 16;
  double get $20 => _spaceFactor * 20;
  double get $24 => _spaceFactor * 24;
  double get $28 => _spaceFactor * 28;
  double get $32 => _spaceFactor * 32;
  double get $36 => _spaceFactor * 36;
  double get $40 => _spaceFactor * 40;

  const CustomSpace._();

  factory CustomSpace() => const CustomSpace._();

  /// accept double value
  double operator [](double i) => _spaceFactor * i;
}

extension CustomSpaceExtension on BuildContext {
  CustomSpace get space => CustomSpace();
}
