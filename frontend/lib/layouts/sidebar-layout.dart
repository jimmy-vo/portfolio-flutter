import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/layouts/horizontal-slidable/layout.dart';
import 'package:frontend/layouts/static/static.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:frontend/page-stacks/menu.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:provider/provider.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (_, SettingsController controller, __) {
        if (!controller.isReady)
          return Center(child: CircularProgressIndicator());

        return Scaffold(
          drawer: SideDrawer(controller: controller),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                controller.navEnable!.value
                    ? HorizontalSlidableWrapper()
                    : StaticLayout(),
                Positioned(
                  bottom: (controller.navEnable!.value &&
                          controller.navPosition!.value ==
                              NavPositionValue.Bottom)
                      ? 5
                      : null,
                  top: (controller.navEnable!.value &&
                          controller.navPosition!.value ==
                              NavPositionValue.Bottom)
                      ? null
                      : 5,
                  left: 5,
                  child: SideDrawerButton(controller: controller),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class SideDrawerButton extends StatefulWidget {
  SettingsController controller;
  SideDrawerButton({required this.controller});
  @override
  State<StatefulWidget> createState() => SideDrawerButtonState();
}

class SideDrawerButtonState extends State<SideDrawerButton> {
  double size = 30;
  Color color = ThemeManager.instance!.getIndicatorIconNormalColor();

  @override
  Widget build(BuildContext context) {
    color = ThemeManager.instance!.getIndicatorIconNormalColor();
    return InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      onTapDown: (_) {
        Scaffold.of(context).openDrawer();
      },
      onHover: (bool isHover) {
        setState(() {
          size = isHover ? 45 : 30;
          color = isHover
              ? ThemeManager.instance!.getIndicatorIconHoverColor()
              : ThemeManager.instance!.getIndicatorIconNormalColor();
        });
        if (widget.controller.navHover!.value) {
          Scaffold.of(context).openDrawer();
        }
      },
      child: Container(
        width: 30,
        height: 30,
        child: Center(
          child: Icon(
            Icons.menu_rounded,
            size: this.size,
            color: color,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SideDrawer extends StatefulWidget {
  SettingsController controller;
  SideDrawer({required this.controller});

  @override
  State<StatefulWidget> createState() => SideDrawerState();
}

class SideDrawerState extends State<SideDrawer> {
  // this check if pop is already requested
  bool popped = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ThemeManager.instance!.getBackgroundColor(),
        child: InkWell(
          onTap: () {},
          onHover: (bool isHover) {
            if (widget.controller.navHover!.value && !isHover && !popped) {
              popped = true;
              Navigator.of(context).pop();
            }
          },
          child: Column(
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                child: Consumer<ProfileController>(
                  builder: (_, ProfileController controller, __) {
                    if (!controller.isReady) return CircularProgressIndicator();

                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(controller.contact.avatar),
                        ),
                      ),
                    );
                  },
                ),
              ),
              MenuPageStack()
            ],
          ),
        ),
      ),
    );
  }
}
