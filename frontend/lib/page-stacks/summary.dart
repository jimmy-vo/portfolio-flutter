// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/contact.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/introduction.dart';
import 'package:frontend/views/profile/recent-items.dart';
import 'package:frontend/views/profile/socials.dart';

// ignore: must_be_immutable
class SummaryPageStack extends HorizontalSlidablePage {
  SummaryPageStack({
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
    super.children = [
      HorizontalSlidablePageChild(
        sectionId: summary.id,
        sectionItemId: 1,
        child: IntroductionView(summary: summary, contact: contact),
      ),
      HorizontalSlidablePageChild(
        sectionId: summary.id,
        sectionItemId: 2,
        child: SocialView(contactSocial: contact.social.first.data),
      ),
      HorizontalSlidablePageChild(
        sectionId: summary.id,
        sectionItemId: 3,
        child: RecentItems(
          title: "Recent Experiences",
          items: experience.items ?? [],
          count: 2,
          onPressed: () => moveToPage!(1),
        ),
      ),
      HorizontalSlidablePageChild(
        sectionId: summary.id,
        sectionItemId: 4,
        child: RecentItems(
          title: education.name ?? "",
          items: education.items ?? [],
          count: 2,
        ),
      ),
      HorizontalSlidablePageChild(
        sectionId: summary.id,
        sectionItemId: 5,
        child: RecentItems(
          title: "Recent Activities",
          items: activities.items ?? [],
          count: 2,
          onPressed: () => moveToPage!(3),
        ),
      ),
    ];
  }
}
