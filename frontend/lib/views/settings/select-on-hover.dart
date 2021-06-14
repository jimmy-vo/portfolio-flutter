import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:provider/provider.dart';

class SelectOnHoverControl extends StatefulWidget {
  const SelectOnHoverControl({Key? key}) : super(key: key);

  @override
  State<SelectOnHoverControl> createState() => _SelectOnHoverControlState();
}

class _SelectOnHoverControlState extends State<SelectOnHoverControl> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady) return CircularProgressIndicator();

        print("Consumer<SettingsController> in _SelectOnHoverState");
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
