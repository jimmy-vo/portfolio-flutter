// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/item.dart';

// ignore: must_be_immutable
class AchivementPageStack extends HorizontalSlidablePage {
  late Section achivements;

  AchivementPageStack({required List<Section> sections}) {
    Section achivements = sections.firstWhere((element) => element.id == 4);
    super.icon = Icons.wine_bar_outlined;
    super.name = achivements.name ?? "";
    super.child = Column(
      children: achivements.items!.map((e) => ItemView(data: e)).toList(),
    );
  }
}
