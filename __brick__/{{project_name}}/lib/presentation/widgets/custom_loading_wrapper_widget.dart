import 'package:flutter/material.dart';

class CustomLoadingWrapperWidget {
  static final CustomLoadingWrapperWidget _instance =
      CustomLoadingWrapperWidget._();

  factory CustomLoadingWrapperWidget.instance() => _instance;

  CustomLoadingWrapperWidget._();

  OverlayEntry? _overlayEntry;

  void show({required BuildContext context}) {
    hide(); // hide existing if any
    _overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black.withOpacity(0.5),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
