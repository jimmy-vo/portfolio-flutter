import 'package:flutter/material.dart';
import 'package:frontend/controller.dart';
import 'package:frontend/layouts/horizontal-slidable/controller.dart';
import 'package:frontend/models/section.dart';
import 'package:provider/provider.dart';

import 'indicator-container.dart';

class HorizontalSlidableWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (_, Controller controller, __) {
        if (!controller.isReady)
          return Center(child: CircularProgressIndicator());

        return HorizontalSlidable(
            manager: HorizontalSlidableManager(
                contact: controller.contact, sections: controller.sections));
      },
    );
  }
}

// ignore: must_be_immutable
class HorizontalSlidable extends StatefulWidget {
  late HorizontalSlidableManager manager;
  HorizontalSlidable({required this.manager});

  @override
  HorizontalSlidableState createState() => HorizontalSlidableState();
}

// ignore: must_be_immutable
class HorizontalSlidableState extends State<HorizontalSlidable> {
  int? hoveringIndex;
  final pageIndexNotifier = ValueNotifier<int>(0);
  PageController pageController = PageController(
    viewportFraction: 1,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset.topCenter,
      children: <Widget>[
        PageView(
          controller: pageController,
          onPageChanged: (index) => pageIndexNotifier.value = index,
          children: this.widget.manager.widgets,
          physics: AlwaysScrollableScrollPhysics(),
        ),
        IndicatorContainer(
          pageIndexNotifier: pageIndexNotifier,
          length: this.widget.manager.widgets.length,
          highlightedName: (index) => this.widget.manager.getName(index),
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
          this.widget.manager.widgets[index].icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
