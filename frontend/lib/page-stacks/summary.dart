// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/contact.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/introduction.dart';
import 'package:frontend/views/recent-items.dart';
import 'package:frontend/views/socials.dart';

// ignore: must_be_immutable
class HorizontalSlidableSummary extends HorizontalSlidablePage {
  HorizontalSlidableSummary({
    required List<Section> sections,
    required Contact contact,
    required Function(int)? moveToPage,
  }) {
    Section summary = sections.firstWhere((element) => element.id == 0);
    Section education = sections.firstWhere((element) => element.id == 3);
    Section experience = sections.firstWhere((element) => element.id == 1);
    Section activities = sections.firstWhere((element) => element.id == 5);
    super.icon = Icons.account_circle_outlined;
    super.name = summary.name ?? "";
    super.child = Column(
      children: [
        IntroductionView(summary: summary, contact: contact),
        RecentItems(
          title: "Recent Experiences",
          items: experience.items ?? [],
          count: 2,
          onPressed: () => moveToPage!(1),
        ),
        RecentItems(
          title: education.name ?? "",
          items: education.items ?? [],
          count: 2,
        ),
        RecentItems(
          title: "Recent Activities",
          items: activities.items ?? [],
          count: 2,
          onPressed: () => moveToPage!(3),
        ),
        SocialView(contactSocial: contact.social.first.data),
      ],
    );
  }
}
