import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/controller.dart';
import 'package:frontend/models/section.dart';

import 'indicator-container.dart';

// ignore: must_be_immutable
class HorizontalSlidable extends StatefulWidget {
  late HorizontalSlidableController controller;
  HorizontalSlidable({required List<Section> sections}) {
    this.controller = HorizontalSlidableController(sections: sections);
  }

  @override
  HorizontalSlidableState createState() {
    return HorizontalSlidableState(controller: this.controller);
  }
}

// ignore: must_be_immutable
class HorizontalSlidableState extends State<HorizontalSlidable> {
  int? hoveringIndex;
  final pageIndexNotifier = ValueNotifier<int>(0);

  HorizontalSlidableController controller;
  PageController pageController = PageController(
    viewportFraction: 1,
    keepPage: true,
  );

  HorizontalSlidableState({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset.topCenter,
      children: <Widget>[
        PageView(
          controller: pageController,
          onPageChanged: (index) => pageIndexNotifier.value = index,
          children: this.controller.widgets,
          physics: AlwaysScrollableScrollPhysics(),
        ),
        IndicatorContainer(
          pageIndexNotifier: pageIndexNotifier,
          length: this.controller.widgets.length,
          highlightedName: (index) => this.controller.getName(index),
          normalBuilder: (animationController, index) => ScaleTransition(
              scale: CurvedAnimation(
                parent: animationController,
                curve: Curves.ease,
              ),
              child: _buildGestureDetector(index, false)),
          highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: _buildGestureDetector(index, true),
          ),
        ),
      ],
    );
  }

  void moveToPage(int index) => pageController.animateToPage(
        index,
        duration: Duration(
            milliseconds:
                (250 * ((index - pageIndexNotifier.value)).abs() + 1)),
        curve: Curves.linear,
      );

  Widget _buildGestureDetector(int index, bool isSelected) {
    double size = 30;
    Color? color = Colors.black87;

    if (isSelected) {
      size = 45;
      color = Colors.blue;
    }

    if (hoveringIndex == index) {
      size = 45;
      color = Colors.greenAccent;
    }

    return InkWell(
      onTap: () => moveToPage(index),
      onHover: (hovering) {
        // hoveringIndex = hovering ? index : null;
        setState(() => hoveringIndex = hovering ? index : null);
        moveToPage(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        child: Icon(
          controller.widgets[index].icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
