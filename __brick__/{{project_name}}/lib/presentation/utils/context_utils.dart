import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/presentation/blocs/blocs.dart';

extension ContextEx on BuildContext {
  /// used for share
  Rect? get sharePositionOrigin {
    final box = findRenderObject() as RenderBox?;
    return box!.localToGlobal(Offset.zero) & box.size;
  }

  void unfocus() => FocusManager.instance.primaryFocus?.unfocus();

  Divider get divider => const Divider(height: 0, thickness: 0.3);

  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Check if the device is a tablet based on screen size
  /// Returns true if the shortest side is greater than 600 logical pixels
  bool get isTablet {
    final size = MediaQuery.of(this).size;
    final shortestSide = size.shortestSide;
    return shortestSide > 600;
  }

  /*
  // subscription
  bool get hasSubscriptionRead => read<SubscriptionCubit>().state.maybeWhen(
    subscribed: () => true,
    orElse: () => false,
  );

  bool get hasSubscriptionWatch => watch<SubscriptionCubit>().state.maybeWhen(
    subscribed: () => true,
    orElse: () => false,
  );

  // gems
  int get gemsRead => read<GemsCubit>().state;
  bool get hasGemsRead => gemsRead > 0;
  int get gemsWatch => watch<GemsCubit>().state;
  bool get hasGemsWatch => gemsWatch > 0;

  // mixed
  bool get hasSubscriptionOrGemsRead => hasSubscriptionRead || hasGemsRead;
  bool get hasSubscriptionOrGemsWatch => hasSubscriptionWatch || hasGemsWatch;
  */
}
