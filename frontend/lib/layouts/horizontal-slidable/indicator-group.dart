import 'package:flutter/material.dart';
import 'package:frontend/main.dart';

// ignore: must_be_immutable
class IndicatorGroup extends StatefulWidget {
  int index;
  double wrapperWidth;
  int? hoveringIndex;
  bool isSelected;
  String? text;
  IconData icon;
  void Function(bool)? onHover;

  ValueNotifier<Key?> iconKeyNotifier = ValueNotifier<Key?>(null);

  IndicatorGroup({
    required this.index,
    required this.wrapperWidth,
    required this.hoveringIndex,
    required this.isSelected,
    required this.text,
    required this.icon,
    required this.onHover,
  });

  @override
  State<StatefulWidget> createState() => IndicatorGroupState();
}

class IndicatorGroupState extends State<IndicatorGroup> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    Color? iconColor = Colors.white;
    TextStyle? textStyle = TextStyleBase.indicatorTextSelected;

    if (widget.isSelected) {
      iconSize = 45;
      iconColor = Colors.blue;
      textStyle = TextStyleBase.indicatorTextSelected;
    }
    if (widget.hoveringIndex == widget.index) {
      iconSize = 45;
      iconColor = Colors.greenAccent;
      textStyle = TextStyleBase.indicatorTextHighlight;
    }

    Widget iconWidget = InkWell(
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
        duration: const Duration(microseconds: 2),
        curve: Curves.ease,
        child: Icon(this.widget.icon, size: iconSize, color: iconColor),
      ),
    );

    return Container(
      width: widget.wrapperWidth,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: iconWidget,
            ),
            AnimatedContainer(
              duration: const Duration(microseconds: 2),
              curve: Curves.ease,
              child: Text(
                this.widget.text ?? "",
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
