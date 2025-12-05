import 'package:flutter/material.dart';

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Duration get reverseTransitionDuration => Duration.zero;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      child;
}

class CustomMaterialPage<T> extends Page<T> {
  final bool maintainState;
  final bool fullscreenDialog;
  final WidgetBuilder builder;
  final bool withAnimation;

  const CustomMaterialPage({
    super.key,
    required this.builder,
    super.name,
    super.arguments,
    super.restorationId,
    this.maintainState = true,
    this.fullscreenDialog = false,
    this.withAnimation = true,
  });

  @override
  Route<T> createRoute(BuildContext context) => withAnimation
      ? MaterialPageRoute<T>(
          builder: builder,
          settings: this,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        )
      : NoAnimationMaterialPageRoute<T>(
          builder: builder,
          settings: this,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}
