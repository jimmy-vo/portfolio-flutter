// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/item.dart';

// ignore: must_be_immutable
class ExperiencePageStack extends HorizontalSlidablePage {
  ExperiencePageStack({required List<Section> sections}) {
    Section section = sections.firstWhere((element) => element.id == 1);
    super.icon = Icons.work_outline_rounded;
    super.name = section.name ?? "";
    super.children = section.items!
        .map((e) => HorizontalSlidablePageChild(
              sectionId: section.id,
              sectionItemId: e.id,
              child: ItemView(data: e),
            ))
        .toList();
  }
}
