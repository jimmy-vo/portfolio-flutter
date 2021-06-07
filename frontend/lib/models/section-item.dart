// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';
import 'package:frontend/models/section-item-description.dart';
import 'package:frontend/models/env-config.dart';

part 'section-item.g.dart';

@JsonSerializable()
class SectionItem {
  num id;
  String? title;
  String? date;
  String? organization;
  String? organizationUrl;
  String? location;
  String? image;
  EnvConfig? config;
  @JsonKey(name: "description")
  List<SectionItemDescription>? descriptions;

  SectionItem({
    required this.id,
    required this.title,
    required this.date,
    required this.organization,
    required this.organizationUrl,
    required this.location,
    required this.config,
    required this.image,
    required this.descriptions,
  });

  bool hasInfo() {
    bool value =
        this.organization != null || this.location != null || this.date != null;

    return value;
  }

  //////////////////////////////////////////////////////////////////////////////
  factory SectionItem.fromJson(Map<String, dynamic> json) =>
      _$SectionItemFromJson(json);
  Map<String, dynamic> toJson() => _$SectionItemToJson(this);
}
