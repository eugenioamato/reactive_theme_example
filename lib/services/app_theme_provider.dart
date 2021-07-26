import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_theme_example/services/brighness_mode_enum.dart';
import 'package:reactive_theme_example/themes.dart';

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

class AppTheme {
  ThemeData getAppThemedata(BuildContext context, BrightnessMode brightnessMode) {
    bool isLight = true;
    if (brightnessMode == BrightnessMode.Dark)
      isLight = false;
    else if (brightnessMode == BrightnessMode.Default) {
      //get brightness from OS
      var brightness = SchedulerBinding.instance!.window.platformBrightness;
      if (brightness == Brightness.dark) isLight = false;
    }

    return isLight ? lightThemeData : darkThemeData;
  }
}
