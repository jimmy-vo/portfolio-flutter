import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:provider/provider.dart';

class NavEnableControl extends StatefulWidget {
  const NavEnableControl({Key? key}) : super(key: key);

  @override
  State<NavEnableControl> createState() => _NavEnableControlState();
}

class _NavEnableControlState extends State<NavEnableControl> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady) return CircularProgressIndicator();

        return Container(
          child: Switch(
              value: controller.navEnable!.value,
              onChanged: (bool? newValue) {
                setState(() {
                  controller.setNavEnable(newValue!);
                });
              }),
        );
      },
    );
  }
}
