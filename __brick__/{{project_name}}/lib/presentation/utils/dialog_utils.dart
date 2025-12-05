// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/generated/translations.g.dart';
import 'package:{{project_name}}/presentation/utils/utils.dart';
import 'package:{{project_name}}/presentation/widgets/widgets.dart';

class DialogUtils {
  static Future<T?> showAlertMessage<T>({
    required BuildContext context,
    required String title,
    String? message,
    DialogAlertType alertType = DialogAlertType.danger,
    String? primaryButtonText,
    Widget? primaryButtonIcon,
    required Function(BuildContext context) onPrimaryButtonTap,
    String? secondaryButtonText,
    Function(BuildContext context)? onSecondaryButtonTap,
    bool isDismissible = true,
    bool autoPop = true,
    Widget? icon,
    Widget? content,
    double borderRadius = CustomCorner.full,
    bool withAnimations = !kIsWeb,
  }) => showModalBottomSheet<T>(
    isDismissible: isDismissible,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: context.colors.surface,
    elevation: 0,
    context: context,
    // constraints: context.isTablet
    //     ? BoxConstraints(
    //         maxWidth:
    //             context.isTablet ? context.space[120] : double.maxFinite)
    //     : null,
    transitionAnimationController: !withAnimations
        ? AnimationController(
            vsync: Navigator.of(context),
            duration: Duration.zero,
          )
        : null,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomModalDragIndicator(),
          const SizedBox(height: 24),
          if (icon != null)
            icon
          else
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const Icon(Icons.info),
            ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: context.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                if (message != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      message,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
          if (content != null)
            Padding(
              padding: EdgeInsets.only(top: context.space.$3),
              child: content,
            ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (alertType == DialogAlertType.neutral)
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: context.colors.primary),
                      foregroundColor: context.colors.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    onPressed: () {
                      if (autoPop) Navigator.pop(context);
                      onPrimaryButtonTap(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (primaryButtonIcon != null) primaryButtonIcon,
                        if (primaryButtonIcon != null) const SizedBox(width: 8),
                        Text(primaryButtonText ?? 'ok'), // TODO
                      ],
                    ),
                  )
                else
                  CustomElevatedButton(
                    onTap: () {
                      if (autoPop) Navigator.pop(context);
                      onPrimaryButtonTap(context);
                    },
                    backgroundColor: alertType == DialogAlertType.danger
                        ? context.colors.error
                        : context.colors.primary,
                    foregroundColor: alertType == DialogAlertType.danger
                        ? context.colors.onError
                        : context.colors.onPrimary,
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (primaryButtonIcon != null) primaryButtonIcon,
                        if (primaryButtonIcon != null) const SizedBox(width: 8),
                        Text(primaryButtonText ?? 'ok'),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
                CustomElevatedButton(
                  onTap: () {
                    if (autoPop) Navigator.pop(context);
                    onSecondaryButtonTap?.call(context);
                  },
                  backgroundColor: context.colors.surfaceContainerHighest,
                  foregroundColor: context.colors.onSurfaceVariant,
                  label: Text(secondaryButtonText ?? 'ok'), //TODO
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );

  static Future<T?> showInfoAlertMessage<T>({
    required BuildContext context,
    required String title,
    String? message,
    String? buttonText,
    Widget? buttonIcon,
    Widget? content,
    required Function(BuildContext context) onButtonTap,
    bool isDismissible = true,
    bool autoPop = true,
    double borderRadius = CustomCorner.full,
    bool withAnimations = !kIsWeb,
  }) => showModalBottomSheet<T>(
    isDismissible: isDismissible,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: context.colors.surface,
    elevation: 0,
    context: context,
    transitionAnimationController: !withAnimations
        ? AnimationController(
            vsync: Navigator.of(context),
            duration: Duration.zero,
          )
        : null,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomModalDragIndicator(),
          if (content != null)
            Padding(
              padding: EdgeInsets.only(top: context.space.$6),
              child: content,
            ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: context.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                if (message != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      message,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomElevatedButton(
                  onTap: () {
                    if (autoPop) Navigator.pop(context);
                    onButtonTap(context);
                  },
                  backgroundColor: context.colors.secondary,
                  foregroundColor: context.colors.onSecondary,
                  label: Text(buttonText ?? 'OK'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );

  /// use ErrorUtil.showErrorBottomSheet instead of this
  static Future<void> showErrorBottomSheet({
    required BuildContext context,
    required VoidCallback onTryAgain,
    required ErrorDisplayData errorData,
    VoidCallback? onDismiss,
  }) async {
    // Flag to track if dismissal was from a button press
    var dismissedByButton = false;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surfaceContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      // Ensure onDismiss is called when modal is dismissed by any means
      isDismissible: true,
      enableDrag: true,
      // Use WillPopScope to catch any dismissal
      builder: (context) => PopScope(
        onPopInvoked: (didPop) {
          // Only call onDismiss if this wasn't triggered by a button press
          if (didPop && !dismissedByButton && onDismiss != null) {
            onDismiss();
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 24,
            bottom: MediaQuery.of(context).viewPadding.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag indicator
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: context.colors.onSurfaceVariant.withAlpha(102),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Error icon - bigger size for better visibility
              errorData.icon ??
                  Image.asset(
                    errorData.iconAsset,
                    width: 240,
                    height: 120,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 240,
                      height: 120,
                      decoration: BoxDecoration(
                        color: context.colors.errorContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.error_outline,
                        color: context.colors.error,
                        size: 48,
                      ),
                    ),
                  ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 240),
                child: Column(
                  children: [
                    SizedBox(height: context.space.$6),
                    // Error title
                    Text(
                      errorData.title,
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: context.colors.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.space[2.5]),
                    // Error description
                    Text(
                      errorData.description,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.space.$11),
              // Action buttons stacked vertically
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Primary action - Try Again
                  ElevatedButton(
                    onPressed: () {
                      dismissedByButton = true;
                      Navigator.of(context).pop();
                      onTryAgain();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: context.colors.primary,
                      foregroundColor: context.colors.onPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(context.t.general.actions.tryAgain),
                  ),
                  const SizedBox(height: 12),
                  // Secondary action - OK (Dismiss)
                  ElevatedButton(
                    onPressed: () {
                      dismissedByButton = true;
                      Navigator.of(context).pop();
                      onDismiss?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: context.colors.surfaceContainerHighest,
                      foregroundColor: context.colors.onSurfaceVariant,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(context.t.general.actions.ok),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
