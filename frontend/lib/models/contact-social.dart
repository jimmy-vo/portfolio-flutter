import 'package:json_annotation/json_annotation.dart';
part 'contact-social.g.dart';

@JsonSerializable()
class ContactSocial {
  String url;
  String text;
  String icon;
  String label;

  ContactSocial({
    required this.url,
    required this.text,
    required this.icon,
    required this.label,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory ContactSocial.fromJson(Map<String, dynamic> json) =>
      _$ContactSocialFromJson(json);
  Map<String, dynamic> toJson() => _$ContactSocialToJson(this);
}
