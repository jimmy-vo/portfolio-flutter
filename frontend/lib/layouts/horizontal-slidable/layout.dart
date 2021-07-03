import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/layouts/horizontal-slidable/indicator-group.dart';
import 'package:frontend/layouts/horizontal-slidable/manager.dart';
import 'package:frontend/models/setting-nav-select-on-hover.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:frontend/themes/theme-manager.dart';
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
  final pageIndexNotifier = ValueNotifier<int>(0);
  late NavSelectOnHover? navSelectOnHover = null;
  late NavPosition? navPosition = null;
  late PageController pageController;

  @override
  initState() {
    super.initState();
    this.widget.manager.moveToPage = this.moveToPage;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
        builder: (_, SettingsController controller, __) {
      if (!controller.isReady) return CircularProgressIndicator();

      this.navSelectOnHover = controller.navHover;
      this.navPosition = controller.navPosition;

      return Stack(
        alignment: controller.navPosition!.value == NavPositionValue.Top
            ? Alignment.topCenter
            : Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          _buildPageView(),
          _buildIndicatorWrapper(),
        ],
      );
    });
  }

  BoxDecoration _buildBoxDecorationGradient() {
    Color background = ThemeManager.instance!.getBackgroundColor();
    List<Color> colors = [
      background.withOpacity(1),
      background.withOpacity(1),
      background.withOpacity(1),
      background.withOpacity(1),
      background.withOpacity(.1),
    ];
    return BoxDecoration(
      gradient: LinearGradient(
        colors: this.navPosition!.value == NavPositionValue.Top
            ? colors
            : colors.reversed.toList(),
        stops: [0.1, 0.2, 0.5, 0.9, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _buildIndicatorWrapper() {
    double wrapperOffset = (MediaQuery.of(context).size.width -
            (widget.offsets.last - widget.offsets.first)) /
        2;

    return Container(
      height: 50,
      decoration: _buildBoxDecorationGradient(),
      child: IndicatorContainer(
        navPositionValue: this.navPosition!.value,
        pageIndexNotifier: pageIndexNotifier,
        length: this.widget.manager.widgets.length,
        getOffset: (int index) => widget.offsets[index] + wrapperOffset,
        normalBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: _buildIndicator(index, this.navPosition!.value, false)),
        highlightedBuilder: (animationController, index) => ScaleTransition(
          scale: CurvedAnimation(
            parent: animationController,
            curve: Curves.ease,
          ),
          child: _buildIndicator(index, this.navPosition!.value, true),
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Selector<RouteController, RouteController>(
        selector: (_, RouteController controller) => controller,
        builder: (_, RouteController controller, __) {
          pageIndexNotifier.value =
              controller.getTargetPageStack(this.widget.manager.widgets);
          pageController = PageController(
            initialPage: pageIndexNotifier.value,
            viewportFraction: 0.999,
            keepPage: true,
          );
          return PageView(
            controller: pageController,
            onPageChanged: (index) {
              pageIndexNotifier.value = index;
              controller
                  .notifyNewStackName(this.widget.manager.widgets[index].name);
            },
            children: this.widget.manager.widgets,
            physics: AlwaysScrollableScrollPhysics(),
          );
        });
  }

  void moveToPage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(
          milliseconds: (250 * ((index - pageIndexNotifier.value)).abs() + 1)),
      curve: Curves.linear,
    );
  }

  Widget _buildIndicator(
    int index,
    NavPositionValue navPositionValue,
    bool isSelected,
  ) {
    return IndicatorGroup(
      navPositionValue: navPositionValue,
      wrapperWidth: widget.indicatorWrapperWidth,
      icon: this.widget.manager.widgets[index].icon,
      index: index,
      isSelected: isSelected,
      onSelected: moveToPage,
      selectOnHover: this.navSelectOnHover!.value,
      text: this.widget.manager.getName(index),
    );
  }
}
