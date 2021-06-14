import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/views/setting-item-wrapper.dart';
import 'package:frontend/views/settings/nav-enable.dart';
import 'package:frontend/views/settings/nav-hover.dart';
import 'package:frontend/views/settings/nav-position.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MenuPageStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady)
          return Center(child: CircularProgressIndicator());

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ExpansionTile(
                maintainState: true,
                initiallyExpanded: true,
                childrenPadding: const EdgeInsets.only(left: 20),
                title: Text("Settings"),
                expandedAlignment: Alignment.topLeft,
                children: <Widget>[
                  SettingItemWrapper(
                    label: "Select on hover",
                    child: NavBarHover(),
                  ),
                  SettingItemWrapper(
                    label: "Navigation bar",
                    child: NavEnable(),
                  ),
                  SettingItemWrapper(
                    label: "Navigation bar position",
                    child:
                        NavBarPosistion(disabled: !controller.navEnable!.value),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
