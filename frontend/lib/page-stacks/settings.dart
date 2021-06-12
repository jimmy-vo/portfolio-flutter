import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/views/setting-item-wrapper.dart';
import 'package:frontend/views/settings/nav-hover.dart';
import 'package:frontend/views/settings/nav-position.dart';

// ignore: must_be_immutable
class HorizontalSlidableSettings extends HorizontalSlidablePage {
  HorizontalSlidableSettings() {
    super.icon = Icons.settings;
    super.name = "Settings";
    super.child = Column(
      children: <Widget>[
        ExpansionTile(
          maintainState: true,
          initiallyExpanded: true,
          childrenPadding: const EdgeInsets.only(left: 20),
          title: Text("Navigation bar"),
          expandedAlignment: Alignment.topLeft,
          children: <Widget>[
            SettingItemWrapper(label: "Position", child: NavBarPosistion()),
            SettingItemWrapper(label: "Select on hover", child: NavBarHover()),
          ],
        ),
      ],
    );
  }
}
