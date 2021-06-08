import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/contact.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/introduction.dart';
import 'package:frontend/views/section-grid.dart';
import 'package:frontend/views/section-list.dart';

class HorizontalSlidableManager {
  List<HorizontalSlidablePage> widgets = [];
  late List<Section> sections;

  HorizontalSlidableManager(
      {required Contact contact, required this.sections}) {
    this.widgets.add(HorizontalSlidableSummary(
          sections: sections,
          contact: contact,
        ));
    this.widgets.add(HorizontalSlidableExperience(sections: sections));
    this.widgets.add(HorizontalSlidableSkills(sections: sections));
    this.widgets.add(HorizontalSlidableAchivement(sections: sections));
    this.widgets.add(HorizontalSlidableVolunteer(sections: sections));
  }

  String getName(int index) {
    return this.widgets[index].name;
  }
}

// ignore: must_be_immutable
class HorizontalSlidableSummary extends HorizontalSlidablePage {
  HorizontalSlidableSummary({
    required List<Section> sections,
    required Contact contact,
  }) {
    Section summary = sections.firstWhere((element) => element.id == 0);
    Section education = sections.firstWhere((element) => element.id == 3);
    super.icon = Icons.account_circle_outlined;
    super.name = summary.name ?? "";
    super.child = Column(
      children: [
        IntroductionView(summary: summary, contact: contact),
        SectionGridView(maxColumnWidth: 700, data: education),
      ],
    );
  }
}

// ignore: must_be_immutable
class HorizontalSlidableExperience extends HorizontalSlidablePage {
  HorizontalSlidableExperience({required List<Section> sections}) {
    Section experience = sections.firstWhere((element) => element.id == 1);
    super.icon = Icons.work_outline_rounded;
    super.name = experience.name ?? "";
    super.child = SectionListView(data: experience);
  }
}

// ignore: must_be_immutable
class HorizontalSlidableSkills extends HorizontalSlidablePage {
  HorizontalSlidableSkills({required List<Section> sections}) {
    Section skills = sections.firstWhere((element) => element.id == 2);
    super.icon = Icons.lightbulb_outline_rounded;
    super.name = skills.name ?? "";
    super.child = SectionGridView(maxColumnWidth: 400, data: skills);
  }
}

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

// ignore: must_be_immutable
class HorizontalSlidableVolunteer extends HorizontalSlidablePage {
  HorizontalSlidableVolunteer({required List<Section> sections}) {
    Section activities = sections.firstWhere((element) => element.id == 5);
    super.icon = Icons.sports_kabaddi_outlined;
    super.name = activities.name ?? "";
    super.child = SectionListView(data: activities);
  }
}
