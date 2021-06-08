import 'package:json_annotation/json_annotation.dart';

part 'description.g.dart';

@JsonSerializable()
class Description {
  String? text;
  List<String>? bullet;

  Description({
    required this.text,
    required this.bullet,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
