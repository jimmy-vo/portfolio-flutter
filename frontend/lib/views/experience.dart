import 'package:flutter/material.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/position.dart';

class ExperienceView extends StatelessWidget {
  Section data;

  ExperienceView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    List<SectionItem> items = this.data.items ?? [];
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: items.map((e) => PositionView(data: e)).toList(),
    );
  }
}
