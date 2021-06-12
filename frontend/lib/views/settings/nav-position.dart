import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:provider/provider.dart';

class NavBarPosistion extends StatefulWidget {
  const NavBarPosistion({Key? key}) : super(key: key);

  @override
  State<NavBarPosistion> createState() => _NavBarPosistionState();
}

class _NavBarPosistionState extends State<NavBarPosistion> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady) return CircularProgressIndicator();

        print("Consumer<SettingsController> in _NavBarPosistionState");
        return Container(
          child: DropdownButton<NavPositionValue>(
            value: controller.navPosition!.value,
            icon: const Icon(Icons.arrow_drop_down),
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (NavPositionValue? newValue) {
              setState(() {
                controller.setNavPosition(newValue!);
              });
            },
            items: NavPositionValue.values
                .map((value) => DropdownMenuItem<NavPositionValue>(
                      value: value,
                      child: Text(value
                          .toString()
                          .substring(value.toString().indexOf('.') + 1)),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
