import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext, double) buildSmall;
  final Widget Function(BuildContext, double) buildMedium;
  final Widget Function(BuildContext, double) buildLarge;

  ResponsiveWidget({
    required this.buildSmall,
    required this.buildMedium,
    required this.buildLarge,
  });

  static Widget same({required Widget Function(BuildContext, double) build}) {
    return ResponsiveWidget(
      buildLarge: build,
      buildMedium: build,
      buildSmall: build,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      return buildLarge(context, width);
    } else if (width > 992) {
      return buildMedium(context, width);
    } else {
      return buildSmall(context, width);
    }
  }
}
