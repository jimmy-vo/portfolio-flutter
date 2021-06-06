import 'package:frontend/models/section-item.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';

part 'section.g.dart';

@JsonSerializable()
class Section {
  num id;
  String? name;
  String? title;
  List<SectionItem>? items;

  Section({
    required this.id,
    required this.name,
    required this.title,
    required this.items,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}
