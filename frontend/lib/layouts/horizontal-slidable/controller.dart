import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/section-list.dart';

class HorizontalSlidableController {
  List<HorizontalSlidablePage> widgets = [];
  late List<Section> sections;

  HorizontalSlidableController({required this.sections}) {
    this.widgets.add(HorizontalSlidableSummary(sections: sections));
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
  late Section summary;
  late Section education;

  HorizontalSlidableSummary({required List<Section> sections}) {
    this.summary = sections.firstWhere((element) => element.id == 0);
    this.education = sections.firstWhere((element) => element.id == 3);
    this.icon = Icons.account_circle_outlined;
    this.name = this.summary.name ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SectionListView(data: this.summary),
        SectionListView(data: this.education),
      ],
    );
  }
}

// ignore: must_be_immutable
class HorizontalSlidableExperience extends HorizontalSlidablePage {
  late Section experience;

  HorizontalSlidableExperience({required List<Section> sections}) {
    this.experience = sections.firstWhere((element) => element.id == 1);
    this.icon = Icons.work_outline_rounded;
    this.name = this.experience.name ?? "";
  }

  @override
  Widget build(BuildContext context) => SectionListView(data: this.experience);
}

// ignore: must_be_immutable
class HorizontalSlidableSkills extends HorizontalSlidablePage {
  late Section skills;

  HorizontalSlidableSkills({required List<Section> sections}) {
    this.skills = sections.firstWhere((element) => element.id == 2);
    this.icon = Icons.lightbulb_outline_rounded;
    this.name = this.skills.name ?? "";
  }

  @override
  Widget build(BuildContext context) => SectionListView(data: this.skills);
}

// ignore: must_be_immutable
class HorizontalSlidableAchivement extends HorizontalSlidablePage {
  late Section achivements;

  HorizontalSlidableAchivement({required List<Section> sections}) {
    this.achivements = sections.firstWhere((element) => element.id == 4);
    this.icon = Icons.wine_bar_outlined;
    this.name = this.achivements.name ?? "";
  }

  @override
  Widget build(BuildContext context) => SectionListView(data: this.achivements);
}

// ignore: must_be_immutable
class HorizontalSlidableVolunteer extends HorizontalSlidablePage {
  late Section activities;

  HorizontalSlidableVolunteer({required List<Section> sections}) {
    this.activities = sections.firstWhere((element) => element.id == 5);
    this.icon = Icons.sports_kabaddi_outlined;
    this.name = this.activities.name ?? "";
  }

  @override
  Widget build(BuildContext context) => SectionListView(data: this.activities);
}
