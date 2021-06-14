import 'package:flutter/material.dart';
import 'package:frontend/views/setting-item-wrapper.dart';
import 'package:frontend/views/settings/nav-enable.dart';
import 'package:frontend/views/settings/nav-hover.dart';
import 'package:frontend/views/settings/nav-position.dart';

// ignore: must_be_immutable
class HorizontalSlidableSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      initiallyExpanded: true,
      childrenPadding: const EdgeInsets.only(left: 20),
      title: SettingItemWrapper(
        label: "Navigation bar",
        child: NavEnable(),
      ),
      expandedAlignment: Alignment.topLeft,
      children: <Widget>[
        SettingItemWrapper(
          label: "Position",
          child: NavBarPosistion(),
        ),
        SettingItemWrapper(
          label: "Select on hover",
          child: NavBarHover(),
        ),
      ],
    );
  }
}
