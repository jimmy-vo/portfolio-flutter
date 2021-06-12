// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HorizontalSlidableSettings extends HorizontalSlidablePage {
  HorizontalSlidableSettings() {
    super.icon = Icons.settings;
    super.name = "Settings";
    super.child = Column(
      children: <Widget>[
        ExpansionTile(
          maintainState: true,
          childrenPadding: const EdgeInsets.only(left: 20),
          title: Text("Settings"),
          children: <Widget>[
            NavBarPosistion(),
          ],
        ),
      ],
    );
  }
}

class NavBarPosistion extends StatefulWidget {
  const NavBarPosistion({Key? key}) : super(key: key);

  @override
  State<NavBarPosistion> createState() => _NavBarPosistionState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NavBarPosistionState extends State<NavBarPosistion> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady) return CircularProgressIndicator();

        print("Consumer<SettingsController> in _NavBarPosistionState");
        return Expanded(
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
