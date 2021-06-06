import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/controller.dart';
import 'package:frontend/main.dart';
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
        PageView.builder(
            controller: pageController,
            onPageChanged: (index) => pageIndexNotifier.value = index,
            itemCount: this.controller.widgets.length,
            itemBuilder: (_, int index) => this.controller.widgets[index]),
        _buildIndicator()
      ],
    );
  }

  Widget _buildGestureDetector(int index, bool isSelected) {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(
          index,
          duration: Duration(
              milliseconds:
                  (250 * ((index - pageIndexNotifier.value)).abs() + 1)),
          curve: Curves.linear,
        );
      },
      // The custom button
      child: Icon(
        controller.widgets[index].icon,
        size: isSelected ? 40 : 30,
        color: isSelected ? Colors.blue : Colors.black87,
      ),
    );
  }

  IndicatorContainer _buildIndicator() {
    return IndicatorContainer(
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
    );
  }
}
