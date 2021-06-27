// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/item.dart';

// ignore: must_be_immutable
class AchivementPageStack extends HorizontalSlidablePage {
  AchivementPageStack({required List<Section> sections}) {
    Section achivements = sections.firstWhere((element) => element.id == 4);
    super.icon = Icons.wine_bar_outlined;
    super.name = achivements.name ?? "";
    super.children = achivements.items!
        .map((e) => HorizontalSlidablePageChild(
              id: "${achivements.id}-${e.id}",
              child: ItemView(data: e),
            ))
        .toList();
  }
}
