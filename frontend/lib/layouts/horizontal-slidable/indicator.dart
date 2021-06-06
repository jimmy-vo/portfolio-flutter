import 'package:flutter/material.dart';

class Indicator {
  Indicator({
    required this.normalController,
    required this.highlightedController,
    this.widget,
    this.builder,
    required this.index,
  });

  AnimationController normalController;
  AnimationController highlightedController;
  Widget? widget;
  WidgetBuilder? builder;
  int index;

  void dispose() {
    normalController.dispose();
    highlightedController.dispose();
  }
}
