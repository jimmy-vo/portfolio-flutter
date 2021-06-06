import 'package:flutter/material.dart';
import 'package:frontend/controller.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/experience.dart';
import 'package:provider/provider.dart';

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
        return Center(
            child: ExperienceView(data: controller.experiences as Section));
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
      home: ChangeNotifierProvider<Controller>(
        create: (_) => Controller(),
        child: HomeView(),
      ),
    );
  }
}
