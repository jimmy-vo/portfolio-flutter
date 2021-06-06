import 'package:flutter/material.dart';
import 'package:frontend/models/section-item-description.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/views/description.dart';
import 'package:frontend/views/image.dart';

import '../main.dart';

// ignore: must_be_immutable
class ItemView extends StatelessWidget {
  SectionItem data;

  ItemView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    List<SectionItemDescription> descriptions = (this.data.descriptions ?? []);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            ItemHeaderView(data: this.data),
            ...descriptions.map((e) => DescriptionView(data: e)).toList(),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemHeaderView extends StatelessWidget {
  late SectionItem data;

  ItemHeaderView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageView(data: this.data),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5.0),
            height: 96,
            child: ItemInfoView(data: this.data),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ItemInfoView extends StatelessWidget {
  SectionItem data;

  ItemInfoView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SelectableText(
            this.data.title ?? "",
            style: TextStyleBase.itemTitle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectableText(
              this.data.organization ?? "",
              style: TextStyleBase.itemOrganization,
            ),
            SelectableText(
              this.data.date ?? "",
              style: TextStyleBase.itemDate,
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SelectableText(
            this.data.location ?? "",
            style: TextStyleBase.itemLocation,
          ),
        ),
      ],
    );
  }
}
