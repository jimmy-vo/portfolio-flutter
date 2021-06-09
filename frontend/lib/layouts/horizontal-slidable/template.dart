import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HorizontalSlidablePage extends StatefulWidget {
  late IconData icon;
  late String name;
  late Widget child;

  @override
  _HorizontalSlidablePageState createState() => _HorizontalSlidablePageState();
}

class _HorizontalSlidablePageState extends State<HorizontalSlidablePage> {
  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: load(),
        builder: (context, snapshot) {
          // return CircularProgressIndicator();
          if (snapshot.hasData) {
            return snapshot.data as Widget;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  Future<Widget> load() async {
    // await Future.delayed(Duration(seconds: 4));
    print("load " + this.widget.name);
    ListView a = ListView(
      children: [
        Container(height: 100),
        widget.child,
        Container(height: 100),
      ],
    );
    return a;
  }
}
