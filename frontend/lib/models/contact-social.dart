import 'package:json_annotation/json_annotation.dart';
part 'contact-social.g.dart';

@JsonSerializable()
class ContactSocial {
  String url;
  String text;
  String icon;

  ContactSocial({
    required this.url,
    required this.text,
    required this.icon,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory ContactSocial.fromJson(Map<String, dynamic> json) =>
      _$ContactSocialFromJson(json);
  Map<String, dynamic> toJson() => _$ContactSocialToJson(this);
}
