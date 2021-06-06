import 'package:frontend/models/section.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';

part 'section-collection.g.dart';

@JsonSerializable()
class SectionCollection {
  List<Section> data;

  SectionCollection({
    required this.data,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory SectionCollection.fromJson(Map<String, dynamic> json) =>
      _$SectionCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionCollectionToJson(this);
}
