import 'package:flutter/material.dart';
import 'package:frontend/models/description.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/views/description.dart';
import 'package:frontend/views/image.dart';

import '../main.dart';

// ignore: must_be_immutable
class ItemView extends StatelessWidget {
  SectionItem data;
  bool? hideDescription;

  ItemView({required this.data, this.hideDescription}) {}

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            ItemHeaderView(data: this.data),
            ...hideDescription != true
                ? [DescriptionView(data: this.data.descriptions ?? [])]
                : [],
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
        ...(this.data.image != null
            ? [ImageView(imageUrl: this.data.image)]
            : []),
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
