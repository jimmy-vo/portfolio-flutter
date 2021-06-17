import 'package:flutter/widgets.dart';
import 'package:frontend/themes/theme-manager.dart';

// ignore: must_be_immutable
class SettingItemWrapper extends StatelessWidget {
  Widget child;
  String label;
  bool disable;

  SettingItemWrapper({
    required this.child,
    required this.label,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disable,
      child: Column(
        children: [
          Row(
            children: [
              Text(label, style: ThemeManager.instance!.socialLabelStyle),
              Expanded(
                  child: Align(
                child: this.child,
                alignment: Alignment.centerRight,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
