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
        ...(this.data.image != null ? [ImageView(data: this.data)] : []),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5.0),
            // height: 96,
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

  List<Widget> _buildInfo() {
    String organization = this.data.organization ?? "";
    String location = this.data.location ?? "";
    String date = this.data.date ?? "";
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText(organization, style: TextStyleBase.itemOrganization),
          SelectableText(date, style: TextStyleBase.itemDate),
        ],
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: SelectableText(location, style: TextStyleBase.itemLocation),
      ),
    ];
  }

  Widget _buildTitle() {
    String title = this.data.title ?? "";
    return Align(
      alignment: Alignment.centerLeft,
      child: SelectableText(title, style: TextStyleBase.itemTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!this.data.hasInfo()) return this._buildTitle();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [this._buildTitle(), ...this._buildInfo()],
    );
  }
}