import 'package:frontend/models/setting-themes.dart';
import 'package:frontend/themes/theme-base.dart';
import 'package:frontend/themes/theme-dart.dart';
import 'package:frontend/themes/theme-light.dart';

class ThemeManager {
  static IsCustomTheme? instance;
  static init(SettingsThemeValue value) {
    if (value == SettingsThemeValue.Light) {
      instance = LightTheme();
    } else if (value == SettingsThemeValue.Light) {
      instance = DartTheme();
    } else {
      instance = DartTheme();
    }
  }
}
