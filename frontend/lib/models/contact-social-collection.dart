import 'package:frontend/models/contact-social.dart';
import 'package:frontend/models/config.dart';
import 'package:json_annotation/json_annotation.dart';
part 'contact-social-collection.g.dart';

@JsonSerializable()
class ContactSocialCollection {
  Config config;
  List<ContactSocial> data;

  ContactSocialCollection({
    required this.config,
    required this.data,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory ContactSocialCollection.fromJson(Map<String, dynamic> json) =>
      _$ContactSocialCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$ContactSocialCollectionToJson(this);
}
