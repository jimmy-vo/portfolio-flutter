import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/layouts/horizontal-slidable/layout.dart';
import 'package:frontend/layouts/static/static.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:frontend/page-stacks/menu.dart';
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
          body: Stack(
            children: [
              controller.navEnable!.value
                  ? HorizontalSlidableWrapper()
                  : StaticLayout(),
              Positioned(
                bottom: (controller.navEnable!.value &&
                        controller.navPosition!.value ==
                            NavPositionValue.Bottom)
                    ? 15
                    : null,
                top: (controller.navEnable!.value &&
                        controller.navPosition!.value ==
                            NavPositionValue.Bottom)
                    ? null
                    : 15,
                left: 15,
                child: SideDrawerButton(controller: controller),
              ),
            ],
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
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
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
          color = isHover ? Colors.greenAccent : Colors.white;
        });
        if (widget.controller.navHover!.value) {
          Scaffold.of(context).openDrawer();
        }
      },
      child: Container(
        width: 40,
        height: 40,
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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: InkWell(
        onTap: () {},
        onHover: (bool isHover) {
          if (!isHover && widget.controller.navHover!.value) {
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
    );
  }
}
