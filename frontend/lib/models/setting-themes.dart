// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting-themes.g.dart';

enum SettingsThemeValue { Light, Dart, Rainbow }

@JsonSerializable()
class SettingsThemes {
  SettingsThemeValue value;

  SettingsThemes({
    required this.value,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory SettingsThemes.fromJson(Map<String, dynamic> json) =>
      _$SettingsThemesFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsThemesToJson(this);

  static String _key = "SettingsThemesValue";
  static late SharedPreferences? _prefs;

  static SettingsThemes fromStorage(SharedPreferences ref) {
    SettingsThemes._prefs = ref;
    Map<String, dynamic> json = {};
    try {
      String? text = ref.getString(SettingsThemes._key);
      json = jsonDecode(text ?? "");
    } catch (e) {
      json = SettingsThemes(value: SettingsThemeValue.Light).toJson();
    }
    return SettingsThemes.fromJson(json);
  }

  void toStorage() {
    SettingsThemes._prefs!
        .setString(SettingsThemes._key, jsonEncode(this.toJson()));
  }
}
