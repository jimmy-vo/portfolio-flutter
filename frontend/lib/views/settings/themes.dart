import 'package:flutter/material.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/models/setting-themes.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ThemeControl extends StatefulWidget {
  final bool disabled;

  const ThemeControl({
    this.disabled = false,
  });

  @override
  State<ThemeControl> createState() => _ThemeControlState();
}

class _ThemeControlState extends State<ThemeControl> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady) return CircularProgressIndicator();

        print("Consumer<SettingsController> in _ThemesState");
        return Container(
          child: DropdownButton<SettingsThemeValue>(
            value: controller.theme!.value,
            icon: const Icon(Icons.arrow_drop_down),
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: widget.disabled
                ? null
                : (SettingsThemeValue? newValue) {
                    setState(() {
                      controller.setTheme(newValue!);
                    });
                  },
            items: SettingsThemeValue.values
                .map((value) => DropdownMenuItem<SettingsThemeValue>(
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
