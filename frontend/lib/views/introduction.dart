import 'package:flutter/material.dart';
import 'package:frontend/models/contact.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/image.dart';
import 'package:frontend/views/item.dart';

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
    return Row(
      children: [
        ImageView(imageUrl: contact.avatar),
        Spacer(),
      ],
    );
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: items.map((e) => ItemView(data: e)).toList(),
    );
  }
}
