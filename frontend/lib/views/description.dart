import 'package:flutter/material.dart';
import 'package:frontend/models/section-item-description.dart';

class DescriptionView extends StatelessWidget {
  SectionItemDescription data;

  DescriptionView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    List<String> bullet = this.data.bullet ?? [];
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        Text(this.data.text ?? ""),
        ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: bullet.map((e) => Text(" - " + e)).toList(),
        ),
      ],
    );
  }
}
