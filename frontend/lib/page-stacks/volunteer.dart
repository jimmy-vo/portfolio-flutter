// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/item.dart';

// ignore: must_be_immutable
class ActivitiesPageStack extends HorizontalSlidablePage {
  ActivitiesPageStack({required List<Section> sections}) {
    Section activities = sections.firstWhere((element) => element.id == 5);
    super.icon = Icons.sports_kabaddi_outlined;
    super.name = activities.name ?? "";
    super.child = Column(
      children: activities.items!.map((e) => ItemView(data: e)).toList(),
    );
  }
}
