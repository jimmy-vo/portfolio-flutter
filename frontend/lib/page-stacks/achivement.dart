// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/section-list.dart';

// ignore: must_be_immutable
class HorizontalSlidableAchivement extends HorizontalSlidablePage {
  late Section achivements;

  HorizontalSlidableAchivement({required List<Section> sections}) {
    Section achivements = sections.firstWhere((element) => element.id == 4);
    super.icon = Icons.wine_bar_outlined;
    super.name = achivements.name ?? "";
    super.child = SectionListView(data: achivements);
  }
}
