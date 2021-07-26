import 'package:flutter/material.dart';
import 'package:reactive_theme_example/services/shared_utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'brighness_mode_enum.dart';

final appThemeStateProvider = StateNotifierProvider<AppThemeNotifier, BrightnessMode>((ref) {
  final _brightnessMode = ref.read(sharedUtilityProvider).getBrightnessMode();
  return AppThemeNotifier(_brightnessMode);
});

class AppThemeNotifier extends StateNotifier<BrightnessMode> {
  AppThemeNotifier(this.defaultBrightnessModeValue) : super(defaultBrightnessModeValue);

  final BrightnessMode defaultBrightnessModeValue;

  setAppTheme(BuildContext context, BrightnessMode value) {
    context
        .read(
          sharedUtilityProvider,
        )
        .setBrightnessMode(value)
        .whenComplete(
          () => {
            state = value,
          },
        );
  }

  void refresh(BrightnessMode value) {
    state = value;
  }

  getState() {
    return state;
  }
}
