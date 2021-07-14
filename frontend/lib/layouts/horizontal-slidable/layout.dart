import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/layouts/horizontal-slidable/indicator-group.dart';
import 'package:frontend/layouts/horizontal-slidable/manager.dart';
import 'package:frontend/layouts/responsive.dart';
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
  final List<double> offsets = [];
  final HorizontalSlidableManager manager;

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
  late NavSelectOnHover? navSelectOnHover = null;
  late NavPosition? navPosition = null;

  @override
  initState() {
    super.initState();
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
          ResponsiveWidget.same(
            build: (_, width) => _buildIndicatorWrapper(width),
          ),
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

  Widget _buildIndicatorWrapper(double screenWidth) {
    double wrapperOffset =
        (screenWidth - (widget.offsets.last - widget.offsets.first)) / 2;

    return Container(
        height: 50,
        decoration: _buildBoxDecorationGradient(),
        child: Selector<RouteController, RouteController>(
            selector: (_, RouteController controller) => controller,
            builder: (_, RouteController controller, __) {
              controller.setHorizontalSlidablePages(widget.manager.widgets);

              return IndicatorContainer(
                  navPositionValue: this.navPosition!.value,
                  pageIndexNotifier: controller.pageIndexNotifier,
                  length: this.widget.manager.widgets.length,
                  getOffset: (int index) =>
                      widget.offsets[index] + wrapperOffset,
                  normalBuilder: (animationController, index) =>
                      ScaleTransition(
                          scale: CurvedAnimation(
                            parent: animationController,
                            curve: Curves.ease,
                          ),
                          child: _buildIndicator(
                              index, this.navPosition!.value, false)),
                  highlightedBuilder: (animationController, index) =>
                      ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animationController,
                          curve: Curves.ease,
                        ),
                        child: _buildIndicator(
                            index, this.navPosition!.value, true),
                      ));
            }));
  }

  Widget _buildPageView() {
    return Selector<RouteController, RouteController>(
        selector: (_, RouteController controller) => controller,
        builder: (_, RouteController controller, __) {
          return PageView(
            controller: controller.pageController,
            onPageChanged: (index) => controller.onPageChanged(index),
            children: this.widget.manager.widgets,
            physics: AlwaysScrollableScrollPhysics(),
          );
        });
  }

  Widget _buildIndicator(
    int index,
    NavPositionValue navPositionValue,
    bool isSelected,
  ) {
    return Selector<RouteController, RouteController>(
      selector: (_, RouteController controller) => controller,
      builder: (_, RouteController controller, __) {
        return IndicatorGroup(
          navPositionValue: navPositionValue,
          wrapperWidth: widget.indicatorWrapperWidth,
          icon: this.widget.manager.widgets[index].icon,
          index: index,
          isSelected: isSelected,
          onSelected: controller.moveToPage,
          selectOnHover: this.navSelectOnHover!.value,
          text: this.widget.manager.getName(index),
        );
      },
    );
  }
}
