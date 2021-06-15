import 'package:flutter/material.dart';
import 'package:frontend/models/description.dart';
import 'package:frontend/themes/theme-manager.dart';

// ignore: must_be_immutable
class DescriptionView extends StatelessWidget {
  List<Description> data;
  late List<TextSpan> list = [];

  DescriptionView({required this.data}) {}

  void append(Description description) {
    List<String> bullet = description.bullet ?? [];
    String text = description.text ?? "";
    String bulletText = bullet.length != 0 ? " - " + bullet.join("\n - ") : "";

    if (text != "") {
      list.add(
        TextSpan(
          text: (list.length != 0 ? "\n\n" : "") + text,
          style: ThemeManager.instance!.descritionTextStyle,
        ),
      );
    }
    if (bulletText != "") {
      list.add(
        TextSpan(
          text: (text != "" ? "\n" : "") + bulletText,
          style: ThemeManager.instance!.descritionBulletStyle,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    data.forEach((element) {
      append(element);
    });

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SelectableText.rich(
          TextSpan(children: list),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
