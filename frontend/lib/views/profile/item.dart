import 'package:flutter/material.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:frontend/views/profile/description.dart';
import 'package:frontend/views/profile/image.dart';

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
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.all(5.0),
              // height: 96,
              child: ItemInfoView(data: this.data),
            ),
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
    String title = this.data.title ?? "";
    if (!this.data.hasInfo())
      return SelectableText(title, style: ThemeManager.instance!.titleStyle);

    String organization = "\n" + (this.data.organization ?? "");
    String location = "\n" + (this.data.location ?? "") + "\n";
    String date = this.data.date ?? "";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SelectableText.rich(TextSpan(children: [
            TextSpan(text: title, style: ThemeManager.instance!.titleStyle),
            TextSpan(
                text: organization,
                style: ThemeManager.instance!.organizationStyle),
            TextSpan(
                text: location, style: ThemeManager.instance!.locationStyle)
          ])),
        ),
        Align(
            alignment: Alignment.topRight,
            child:
                SelectableText(date, style: ThemeManager.instance!.dateStyle))
      ],
    );
  }
}
