// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';
part 'env-config.g.dart';

@JsonSerializable()
class EnvConfig {
  bool dev;
  bool tech;

  EnvConfig({
    required this.dev,
    required this.tech,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory EnvConfig.fromJson(Map<String, dynamic> json) =>
      _$EnvConfigFromJson(json);
  Map<String, dynamic> toJson() => _$EnvConfigToJson(this);
}
