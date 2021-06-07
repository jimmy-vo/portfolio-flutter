import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/section-item-description.dart';

// ignore: must_be_immutable
class DescriptionView extends StatelessWidget {
  SectionItemDescription data;

  DescriptionView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    List<String> bullet = this.data.bullet ?? [];
    String text = this.data.text ?? "";
    String bulletText = bullet.length != 0 ? " - " + bullet.join("\n - ") : "";
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          ...text != ""
              ? [SelectableText(text, style: TextStyleBase.itemDescritionText)]
              : [],
          ...bulletText != ""
              ? [
                  SelectableText(bulletText,
                      style: TextStyleBase.itemDescritionBullet)
                ]
              : [],
        ],
      ),
    );
  }
}
