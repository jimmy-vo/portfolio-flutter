// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/section-list.dart';

// ignore: must_be_immutable
class ExperiencePageStack extends HorizontalSlidablePage {
  ExperiencePageStack({required List<Section> sections}) {
    Section experience = sections.firstWhere((element) => element.id == 1);
    super.icon = Icons.work_outline_rounded;
    super.name = experience.name ?? "";
    super.child = SectionListView(section: experience);
  }
}
