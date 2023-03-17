import 'package:flutter/material.dart';
import 'package:flutter_paystack/src/widgets/common/loading_overlay.dart';
import 'package:provider/provider.dart';

extension Context on BuildContext {
  TextTheme textTheme() => Theme.of(this).textTheme;

  ColorScheme colorScheme() => Theme.of(this).colorScheme;
}

extension LoadingOverlayEx on BuildContext {
  bool get isLoading => read<LoadingOverlayProvider>().isLoading;

  void showLoader({bool shouldRebuild = true}) {
    read<LoadingOverlayProvider>().show(shouldRebuild: shouldRebuild);
  }

  void hideLoader({bool shouldRebuild = true}) {
    read<LoadingOverlayProvider>().hide(shouldRebuild: shouldRebuild);
  }

  void setIsWhiteBg(bool value, {bool shouldRebuild = true}) {
    read<LoadingOverlayProvider>().setIsWhiteBg(
      value,
      shouldRebuild: shouldRebuild,
    );
  }
}