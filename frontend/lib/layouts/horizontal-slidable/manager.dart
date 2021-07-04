import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/layouts/table-card-group.dart';
import 'package:frontend/models/contact.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/introduction.dart';
import 'package:frontend/views/profile/item.dart';
import 'package:frontend/views/profile/socials.dart';

class HorizontalSlidableManager {
  List<IsHorizontalSlidablePage> widgets = [];
  late List<Section> sections;
  Function(int)? moveToPage;

  HorizontalSlidableManager({
    required Contact contact,
    required this.sections,
  }) {
    Section summary = sections.firstWhere((element) => element.id == 0);
    Section experience = sections.firstWhere((element) => element.id == 1);
    Section skills = sections.firstWhere((element) => element.id == 2);
    Section education = sections.firstWhere((element) => element.id == 3);
    Section achivement = sections.firstWhere((element) => element.id == 4);
    Section activities = sections.firstWhere((element) => element.id == 5);

    this.widgets.add(
          HorizontalSlidablePage(
            icon: Icons.account_circle_outlined,
            name: summary.name!,
            children: [
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
                child: TableCardGroup(
                  title: "Recent Experiences",
                  column: 2,
                  children: (experience.items ?? [])
                      .map((e) => ItemView(
                            data: e,
                            hideDescription: true,
                            narrowView: true,
                          ))
                      .toList(),
                ),
              ),
              HorizontalSlidablePageChild(
                sectionId: summary.id,
                sectionItemId: 4,
                child: TableCardGroup(
                  title: education.name ?? "",
                  column: 2,
                  children: (education.items ?? [])
                      .map((e) => ItemView(
                            data: e,
                            hideDescription: true,
                            narrowView: true,
                          ))
                      .toList(),
                ),
              ),
              HorizontalSlidablePageChild(
                sectionId: summary.id,
                sectionItemId: 5,
                child: TableCardGroup(
                  title: "Recent Activities",
                  column: 2,
                  children: (activities.items ?? [])
                      .map((e) => ItemView(
                            data: e,
                            hideDescription: true,
                            narrowView: true,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
    this.widgets.add(
          HorizontalSlidablePage.fromSection(
            section: experience,
            icon: Icons.wine_bar_outlined,
          ),
        );
    this.widgets.add(
          HorizontalSlidablePage.fromSection(
            section: skills,
            icon: Icons.lightbulb_outline_rounded,
          ),
        );
    this.widgets.add(
          HorizontalSlidablePage.fromSection(
            section: achivement,
            icon: Icons.wine_bar_outlined,
          ),
        );
    this.widgets.add(
          HorizontalSlidablePage.fromSection(
            section: activities,
            icon: Icons.sports_kabaddi_outlined,
          ),
        );
  }

  String getName(int index) {
    return this.widgets[index].name;
  }
}
