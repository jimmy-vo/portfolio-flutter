import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/layouts/sidebar-layout.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsController>(
      create: (context) => SettingsController(),
      child: ChangeNotifierProvider<ProfileController>(
        create: (_) => ProfileController(),
        child: Consumer<SettingsController>(
          builder: (_, SettingsController controller, __) {
            if (!controller.isReady)
              return Center(child: CircularProgressIndicator());

            ThemeManager.init(controller.theme!.value);
            print(ThemeManager.instance!.getBackgroundColor());
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Jimmy Vo',
              // color: ThemeManager.instance!.getBackgroundColor(),
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
    );
  }
}
