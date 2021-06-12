import 'package:flutter/widgets.dart';
import 'package:frontend/main.dart';

// ignore: must_be_immutable
class SettingItemWrapper extends StatelessWidget {
  Widget child;
  String label;

  SettingItemWrapper({
    required this.child,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(label, style: TextStyleBase.socialLabel),
          Expanded(
              child: Align(
            child: this.child,
            alignment: Alignment.centerRight,
          )),
        ],
      ),
    ]);
  }
}
