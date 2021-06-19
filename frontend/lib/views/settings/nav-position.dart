import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NavBarPosistionControl extends StatefulWidget {
  final bool disabled;

  const NavBarPosistionControl({
    this.disabled = false,
  });

  @override
  State<NavBarPosistionControl> createState() => _NavBarPosistionControlState();
}

class _NavBarPosistionControlState extends State<NavBarPosistionControl> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        return Container(
          child: DropdownButton<NavPositionValue>(
            value: controller.navPosition!.value,
            icon: const Icon(Icons.arrow_drop_down),
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: widget.disabled
                ? null
                : (NavPositionValue? newValue) {
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
