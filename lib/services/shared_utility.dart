import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'brighness_mode_enum.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final _sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: _sharedPrefs);
});

class SharedUtility {
  static const brightnessModeToken = 'brightnessMode';

  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  BrightnessMode getBrightnessMode() {
    int? brightness = sharedPreferences.getInt(brightnessModeToken);
    switch (brightness) {
      case 1:
        return BrightnessMode.Default;
      case 2:
        return BrightnessMode.Light;
      case 3:
        return BrightnessMode.Dark;
      default:
        return BrightnessMode.Unknown;
    }
  }

  Future<bool> setBrightnessMode(BrightnessMode value) async {
    return await sharedPreferences.setInt(brightnessModeToken, value.index);
  }
}
