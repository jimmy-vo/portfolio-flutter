import 'package:flutter/material.dart';
import 'package:frontend/layouts/card-group.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:frontend/views/profile/description.dart';
import 'package:frontend/views/profile/image.dart';

// ignore: must_be_immutable
class ItemView extends StatelessWidget {
  SectionItem data;
  bool? hideDescription;
  bool? narrowView;
  bool? noSpacing;

  ItemView({
    required this.data,
    this.hideDescription,
    this.noSpacing,
    this.narrowView,
  }) {}

  @override
  Widget build(BuildContext context) {
    return CardGroup(
      noSpacing: this.noSpacing,
      child: Column(
        children: [
          ItemHeaderView(
            data: this.data,
            narrowView: this.narrowView,
          ),
          ...hideDescription != true
              ? [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: DescriptionView(data: this.data.descriptions ?? []),
                  )
                ]
              : [],
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemHeaderView extends StatelessWidget {
  late SectionItem data;
  bool? narrowView;

  ItemHeaderView({
    required this.data,
    this.narrowView,
  });

  @override
  Widget build(BuildContext context) {
    return !this.data.hasInfo()
        ? Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child: SelectableText(this.data.title ?? "",
                style: ThemeManager.instance!.titleStyle),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...(this.data.image != null
                  ? [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: ImageView(imageUrl: this.data.image),
                      )
                    ]
                  : []),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 5,
                      bottom: 5,
                    ),
                    // height: 96,
                    child: ItemInfoView(
                      data: this.data,
                      narrowView: this.narrowView,
                    ),
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
  bool? narrowView;

  ItemInfoView({
    required this.data,
    this.narrowView,
  });

  Widget _buildWideView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SelectableText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: this.data.title ?? "",
                  style: ThemeManager.instance!.titleStyle,
                ),
                TextSpan(
                  text: "\n" + (this.data.organization ?? ""),
                  style: ThemeManager.instance!.organizationStyle,
                ),
                TextSpan(
                  text: "\n" + (this.data.location ?? "") + "\n",
                  style: ThemeManager.instance!.locationStyle,
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: SelectableText(
            this.data.date ?? "",
            style: ThemeManager.instance!.dateStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowView() {
    String combined =
        (this.data.title ?? "") + " \@ " + (this.data.organization ?? "");
    return Align(
      alignment: Alignment.topLeft,
      child: SelectableText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: combined,
              style: ThemeManager.instance!.titleStyle,
            ),
            TextSpan(
              text: "\n" + (this.data.date ?? ""),
              style: ThemeManager.instance!.dateStyle,
            ),
            TextSpan(
              text: "\n" + (this.data.location ?? ""),
              style: ThemeManager.instance!.locationStyle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.narrowView == true ? _buildNarrowView() : _buildWideView();
  }
}
