import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:provider/provider.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsController>(
      create: (context) => SettingsController(),
      child: ChangeNotifierProvider<RouteController>(
        create: (_) => RouteController(),
        child: ChangeNotifierProvider<ProfileController>(
          create: (_) => ProfileController(),
          child: Consumer<SettingsController>(
            builder: (_, SettingsController settingsController, __) {
              if (!settingsController.isReady)
                return Center(child: CircularProgressIndicator());

              ThemeManager.init(settingsController.theme!.value);
              return Consumer<RouteController>(
                builder: (_, RouteController routeController, __) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Jimmy Vo',
                    onGenerateRoute: routeController.onGenerateRoute,
                    theme: ThemeData(
                      scaffoldBackgroundColor:
                          ThemeManager.instance!.getBackgroundColor(),
                      cardColor: ThemeManager.instance!.getBackgroundColor(),
                      backgroundColor:
                          ThemeManager.instance!.getBackgroundColor(),
                      primarySwatch: Colors.blue,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    // home: SideBarLayout(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
