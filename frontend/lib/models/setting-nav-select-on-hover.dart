// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting-nav-select-on-hover.g.dart';

@JsonSerializable()
class NavSelectOnHover {
  bool value;

  NavSelectOnHover({
    required this.value,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory NavSelectOnHover.fromJson(Map<String, dynamic> json) =>
      _$NavSelectOnHoverFromJson(json);
  Map<String, dynamic> toJson() => _$NavSelectOnHoverToJson(this);

  static String _key = "NavHover";
  static late SharedPreferences? _prefs;

  static NavSelectOnHover fromStorage(SharedPreferences ref) {
    NavSelectOnHover._prefs = ref;
    Map<String, dynamic> json = {};
    try {
      String? text = ref.getString(NavSelectOnHover._key);
      json = jsonDecode(text ?? "");
    } catch (e) {
      json = NavSelectOnHover(value: true).toJson();
    }
    return NavSelectOnHover.fromJson(json);
  }

  void toStorage() {
    NavSelectOnHover._prefs!
        .setString(NavSelectOnHover._key, jsonEncode(this.toJson()));
  }
}
