import 'package:flutter/material.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/item.dart';

// ignore: must_be_immutable
class SectionListView extends StatelessWidget {
  Section data;

  SectionListView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    List<SectionItem> items = this.data.items ?? [];
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: items.map((e) => ItemView(data: e)).toList(),
    );
  }
}
