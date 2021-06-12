// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting-nav-enable.g.dart';

@JsonSerializable()
class NavEnable {
  bool value;

  NavEnable({
    required this.value,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory NavEnable.fromJson(Map<String, dynamic> json) =>
      _$NavEnableFromJson(json);
  Map<String, dynamic> toJson() => _$NavEnableToJson(this);

  static String _key = "NavEnable";
  static late SharedPreferences? _prefs;

  static NavEnable fromStorage(SharedPreferences ref) {
    NavEnable._prefs = ref;
    Map<String, dynamic> json = {};
    try {
      String? text = ref.getString(NavEnable._key);
      json = jsonDecode(text ?? "");
    } catch (e) {
      json = NavEnable(value: true).toJson();
    }
    return NavEnable.fromJson(json);
  }

  void toStorage() {
    NavEnable._prefs!.setString(NavEnable._key, jsonEncode(this.toJson()));
  }
}
