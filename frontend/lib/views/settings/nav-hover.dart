import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:provider/provider.dart';

class NavBarHover extends StatefulWidget {
  const NavBarHover({Key? key}) : super(key: key);

  @override
  State<NavBarHover> createState() => _NavBarHoverState();
}

class _NavBarHoverState extends State<NavBarHover> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady) return CircularProgressIndicator();

        print("Consumer<SettingsController> in _NavBarHoverState");
        return Container(
          child: Switch(
              value: controller.navHover!.value,
              onChanged: (bool? newValue) {
                setState(() {
                  controller.setNavHover(newValue!);
                });
              }),
        );
      },
    );
  }
}
