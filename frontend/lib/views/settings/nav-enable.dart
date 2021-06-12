import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:provider/provider.dart';

class NavEnable extends StatefulWidget {
  const NavEnable({Key? key}) : super(key: key);

  @override
  State<NavEnable> createState() => _NavEnableState();
}

class _NavEnableState extends State<NavEnable> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady) return CircularProgressIndicator();

        print("Consumer<SettingsController> in _NavEnableState");
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
