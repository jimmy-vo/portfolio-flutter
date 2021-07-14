import 'package:flutter/material.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:frontend/layouts/card-group.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:frontend/views/profile/description.dart';
import 'package:frontend/views/profile/image.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemView extends StatelessWidget {
  SectionItem sectionItem;
  bool? hideDescription;
  bool? clickable;
  num? sectionId;

  ItemView({
    required this.sectionItem,
    this.hideDescription,
    this.clickable,
    required this.sectionId,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<RouteController, RouteController>(
      selector: (_, RouteController controller) => controller,
      builder: (_, RouteController controller, __) {
        return CardGroup(
          onTap: clickable == null
              ? null
              : () => controller.navigateToFragment(sectionItem.fragment),
          child: Column(
            children: [
              ItemHeaderView(
                sectionItem: this.sectionItem,
                narrowView: this.clickable,
              ),
              ...hideDescription != true
                  ? [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: DescriptionView(
                            data: this.sectionItem.descriptions ?? []),
                      )
                    ]
                  : [],
            ],
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class ItemHeaderView extends StatelessWidget {
  late SectionItem sectionItem;
  bool? narrowView;

  ItemHeaderView({
    required this.sectionItem,
    this.narrowView,
  });

  @override
  Widget build(BuildContext context) {
    return !this.sectionItem.hasInfo()
        ? Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child: SelectableText(this.sectionItem.title ?? "",
                style: ThemeManager.instance!.titleStyle),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...(this.sectionItem.image != null
                  ? [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: ImageView(imageUrl: this.sectionItem.image),
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
                      data: this.sectionItem,
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
    return Align(
      alignment: Alignment.topLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: this.data.title,
              style: ThemeManager.instance!.titleStyle,
            ),
            TextSpan(
              text: "\n" + (this.data.organization ?? ""),
              style: ThemeManager.instance!.organizationStyle,
            ),
            TextSpan(
              text: "\n" + (this.data.date ?? ""),
              style: ThemeManager.instance!.dateStyle,
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
