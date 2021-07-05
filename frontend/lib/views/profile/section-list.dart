import 'package:flutter/material.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/item.dart';

// ignore: must_be_immutable
class SectionListView extends StatelessWidget {
  late Section section;
  SectionListView({required this.section}) {}

  @override
  Widget build(BuildContext context) {
    List<SectionItem> items = this.section.items ?? [];
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: items
          .map((e) => ItemView(
                sectionItem: e,
                sectionId: this.section.id,
              ))
          .toList(),
    );
  }
}
