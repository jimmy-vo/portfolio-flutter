import 'package:flutter/material.dart';
import 'package:frontend/main.dart';

// ignore: must_be_immutable
class IndicatorGroup extends StatefulWidget {
  int index;
  int? hoveringIndex;
  bool isSelected;
  String? text;
  IconData icon;
  void Function(bool)? onHover;

  IndicatorGroup({
    required this.icon,
    required this.index,
    required this.text,
    required this.hoveringIndex,
    required this.isSelected,
    required this.onHover,
  });

  @override
  State<StatefulWidget> createState() => IndicatorGroupState();
}

class IndicatorGroupState extends State<IndicatorGroup> {
  @override
  Widget build(BuildContext context) {
    double size = 30;
    Color? color = Colors.white;

    if (widget.isSelected) {
      size = 45;
      color = Colors.blue;
    }
    if (widget.hoveringIndex == widget.index) {
      size = 45;
      color = Colors.greenAccent;
    }

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              this.widget.onHover!(true);
            },
            onTapDown: (_) {
              this.widget.onHover!(true);
            },
            onHover: (bool hovering) {
              setState(() {
                this.widget.onHover!(hovering);
              });
            },
            // onHover: this.onHover,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease,
              child: Icon(this.widget.icon, size: size, color: color),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            curve: Curves.ease,
            child: Text(
              this.widget.text ?? "",
              style: TextStyleBase.itemTitle,
            ),
          ),
        ),
      ],
    );
  }
}
