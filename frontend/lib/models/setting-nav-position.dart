// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting-nav-position.g.dart';

enum NavPositionValue { Top, Bottom }

@JsonSerializable()
class NavPosition {
  NavPositionValue value;

  NavPosition({
    required this.value,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory NavPosition.fromJson(Map<String, dynamic> json) =>
      _$NavPositionFromJson(json);
  Map<String, dynamic> toJson() => _$NavPositionToJson(this);

  static String _key = "NavPositionValue";
  static late SharedPreferences? _prefs;

  static NavPosition fromStorage(SharedPreferences ref) {
    NavPosition._prefs = ref;
    Map<String, dynamic> json = {};
    try {
      String? text = ref.getString(NavPosition._key);
      json = jsonDecode(text ?? "");
    } catch (e) {
      json = NavPosition(value: NavPositionValue.Top).toJson();
    }
    return NavPosition.fromJson(json);
  }

  void toStorage() {
    NavPosition._prefs!.setString(NavPosition._key, jsonEncode(this.toJson()));
  }
}
