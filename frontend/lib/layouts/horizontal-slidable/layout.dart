import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/layouts/horizontal-slidable/indicator-group.dart';
import 'package:frontend/layouts/horizontal-slidable/manager.dart';
import 'package:provider/provider.dart';
import 'indicator-container.dart';

// ignore: must_be_immutable
class HorizontalSlidableWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
      builder: (_, ProfileController controller, __) {
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
  final double indicatorWrapperWidth = 500;
  final double indicatorOfsetFactor = 50;
  List<double> offsets = [];
  late HorizontalSlidableManager manager;

  HorizontalSlidable({required this.manager}) {
    for (int i = 0; i < this.manager.widgets.length; i++) {
      offsets
          .add(i * this.indicatorOfsetFactor - this.indicatorWrapperWidth / 2);
    }
  }

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
  initState() {
    super.initState();
    this.widget.manager.moveToPage = this.moveToPage;
  }

  @override
  Widget build(BuildContext context) {
    double wrapperOffset = (MediaQuery.of(context).size.width -
            (widget.offsets.last - widget.offsets.first)) /
        2;
    return Stack(
      alignment: FractionalOffset.topCenter,
      clipBehavior: Clip.none,
      children: <Widget>[
        PageView(
          controller: pageController,
          onPageChanged: (index) => pageIndexNotifier.value = index,
          children: this.widget.manager.widgets,
          physics: AlwaysScrollableScrollPhysics(),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black54.withOpacity(1),
                Colors.black.withOpacity(1),
                Colors.black54.withOpacity(1),
                Colors.white.withOpacity(1),
                Colors.white.withOpacity(.1),
              ],
              stops: [0.1, 0.2, 0.5, 0.9, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: IndicatorContainer(
            pageIndexNotifier: pageIndexNotifier,
            length: this.widget.manager.widgets.length,
            getOffset: (int index) => widget.offsets[index] + wrapperOffset,
            normalBuilder: (animationController, index) => ScaleTransition(
                scale: CurvedAnimation(
                  parent: animationController,
                  curve: Curves.ease,
                ),
                child: _buildIndicator(index, false)),
            highlightedBuilder: (animationController, index) => ScaleTransition(
              scale: CurvedAnimation(
                parent: animationController,
                curve: Curves.ease,
              ),
              child: _buildIndicator(index, true),
            ),
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

  Widget _buildIndicator(int index, bool isSelected) {
    return IndicatorGroup(
      wrapperWidth: widget.indicatorWrapperWidth,
      hoveringIndex: hoveringIndex,
      icon: this.widget.manager.widgets[index].icon,
      index: index,
      isSelected: isSelected,
      onHover: (bool hovering) {
        int? newHoveringIndex = hovering ? index : null;
        if (newHoveringIndex != hoveringIndex) {
          setState(() {
            hoveringIndex = newHoveringIndex;
          });
          moveToPage(index);
        }
      },
      text: isSelected ? this.widget.manager.getName(index) : "",
    );
  }
}
