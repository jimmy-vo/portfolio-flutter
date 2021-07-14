import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/layouts/sidebar-layout.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:provider/provider.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(MyApp(RouteController.getCurrentUri()));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Uri uri;
  MyApp(this.uri);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RouteController>(
      create: (context) => RouteController(this.uri, ""),
      child: ChangeNotifierProvider<SettingsController>(
        create: (_) => SettingsController(),
        child: ChangeNotifierProvider<ProfileController>(
          create: (_) => ProfileController(),
          child: Consumer<SettingsController>(
            builder: (_, SettingsController settingsController, __) {
              if (!settingsController.isReady)
                return Center(child: CircularProgressIndicator());

              ThemeManager.init(settingsController.theme!.value);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Jimmy Vo',
                theme: ThemeData(
                  scaffoldBackgroundColor:
                      ThemeManager.instance!.getBackgroundColor(),
                  cardColor: ThemeManager.instance!.getBackgroundColor(),
                  backgroundColor: ThemeManager.instance!.getBackgroundColor(),
                  primarySwatch: Colors.blue,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                home: SideBarLayout(),
              );
            },
          ),
        ),
      ),
    );
  }
}
