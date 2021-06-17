import 'package:flutter/material.dart';
import 'package:frontend/models/contact.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/layouts/card-group.dart';
import 'package:frontend/views/profile/description.dart';

// ignore: must_be_immutable
class IntroductionView extends StatelessWidget {
  Contact contact;
  late List<SectionItem> items;
  IntroductionView({
    required Section summary,
    required this.contact,
  }) {
    items = summary.items ?? [];
  }

  @override
  Widget build(BuildContext context) {
    items.first.descriptions!.first.text = items.first.title;
    return CardGroup(
      title: "Hightlights",
      child: DescriptionView(data: items.first.descriptions ?? []),
    );
  }
}
