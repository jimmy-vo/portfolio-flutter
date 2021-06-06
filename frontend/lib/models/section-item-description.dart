import 'package:frontend/models/env-config.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section-item-description.g.dart';

@JsonSerializable()
class SectionItemDescription {
  String? text;
  List<String>? bullet;

  SectionItemDescription({
    required this.text,
    required this.bullet,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory SectionItemDescription.fromJson(Map<String, dynamic> json) =>
      _$SectionItemDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionItemDescriptionToJson(this);
}
