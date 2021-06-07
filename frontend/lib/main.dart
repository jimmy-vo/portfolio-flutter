import 'package:flutter/material.dart';
import 'package:frontend/controller.dart';
import 'package:frontend/layouts/horizontal-slidable/layout.dart';
import 'package:provider/provider.dart';

class TextStyleBase {
  static const itemTitle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
  );
  static const itemOrganization = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const itemDate = TextStyle(
    fontSize: 20,
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
}

void main() {
  runApp(MyApp());
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (_, Controller controller, __) {
        if (!controller.isReady) return Spacer();

        print("Consumer<Controller> in Main");
        return HorizontalSlidable(sections: controller.sections);
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ChangeNotifierProvider<Controller>(
          create: (_) => Controller(),
          child: HomeView(),
        ),
      ),
    );
  }
}
