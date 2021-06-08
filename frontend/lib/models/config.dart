// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';
part 'config.g.dart';

@JsonSerializable()
class Config {
  bool dev;
  bool tech;

  Config({
    required this.dev,
    required this.tech,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
