import 'package:flutter/material.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:frontend/themes/theme-manager.dart';

// ignore: must_be_immutable
class IndicatorGroup extends StatefulWidget {
  int index;
  double wrapperWidth;
  bool isSelected;
  void Function(int) onSelected;
  String? text;
  IconData icon;
  NavPositionValue? navPositionValue;
  ValueNotifier<Key?> iconKeyNotifier = ValueNotifier<Key?>(null);
  bool selectOnHover;

  IndicatorGroup({
    required this.index,
    required this.wrapperWidth,
    required this.isSelected,
    required this.text,
    required this.icon,
    required this.selectOnHover,
    required this.onSelected,
    required this.navPositionValue,
  });

  @override
  State<StatefulWidget> createState() => IndicatorGroupState();
}

class IndicatorGroupState extends State<IndicatorGroup> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    Color? iconColor = ThemeManager.instance!.getIndicatorIconNormalColor();
    TextStyle textStyle = ThemeManager.instance!.indicatorTextNormalStyle;

    if (this.isHover) {
      iconSize = 50;
      iconColor = ThemeManager.instance!.getIndicatorIconHoverColor();
      textStyle = ThemeManager.instance!.indicatorTextHoverStyle;
    } else if (widget.isSelected) {
      iconSize = 50;
      iconColor = ThemeManager.instance!.getIndicatorIconSelectedColor();
      textStyle = ThemeManager.instance!.indicatorTextHoverStyle;
    }

    Widget iconWidget = InkWell(
      onTap: () {
        this.widget.onSelected(widget.index);
      },
      onTapDown: (_) {
        this.widget.onSelected(widget.index);
      },
      onHover: (bool isHover) {
        if (this.isHover != isHover)
          setState(() {
            this.isHover = isHover;
            if (this.widget.selectOnHover) {
              this.widget.onSelected(widget.index);
            }
          });
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 2),
        curve: Curves.ease,
        child: Icon(this.widget.icon, size: iconSize, color: iconColor),
      ),
    );

    List<Widget> children = [
      Padding(
        padding: const EdgeInsets.all(0.0),
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
    ];

    return Container(
      width: widget.wrapperWidth,
      child: Center(
        child: Column(
            children: widget.navPositionValue == NavPositionValue.Top
                ? children
                : children.reversed.toList()),
      ),
    );
  }
}
