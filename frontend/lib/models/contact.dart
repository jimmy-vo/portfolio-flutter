// ignore: import_of_legacy_library_into_null_safe
import 'package:frontend/models/contact-social-collection.dart';
import 'package:frontend/models/description.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  String avatar;
  String name;
  String pdfUrf;
  List<Description> description;
  List<ContactSocialCollection> social;

  Contact({
    required this.avatar,
    required this.name,
    required this.pdfUrf,
    required this.description,
    required this.social,
  });

  //////////////////////////////////////////////////////////////////////////////
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
