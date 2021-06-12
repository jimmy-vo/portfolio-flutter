import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/controllers/settings.controller.dart';
import 'package:frontend/layouts/horizontal-slidable/layout.dart';
import 'package:frontend/page-stacks/settings.dart';
import 'package:provider/provider.dart';

class TextStyleBase {
  static const cardTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  );
  static const indicatorTextNormal = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Colors.transparent,
  );
  static const indicatorTextSelected = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Colors.transparent,
  );
  static const indicatorTextHighlight = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Colors.greenAccent,
  );
  static const itemTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );
  static const itemOrganization = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );
  static const itemDate = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
  );
  static const itemLocation = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
  );
  static const itemDescritionText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  );
  static const itemDescritionBullet = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  );
  static const socialLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const linkText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsController>(
      create: (context) => SettingsController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          drawer: SideDrawer(),
          body: ChangeNotifierProvider<ProfileController>(
            create: (_) => ProfileController(),
            child: HorizontalSlidableWrapper(),
          ),
        ),
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Side menu  FlutterCorner',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          HorizontalSlidableSettings()
        ],
      ),
    );
  }
}
