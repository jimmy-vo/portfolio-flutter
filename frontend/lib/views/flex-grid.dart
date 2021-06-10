import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlexGridView extends StatefulWidget {
  List<Widget> children;
  int maxColumnWidth;
  double? wrapperWidth;
  FlexGridView({
    required this.maxColumnWidth,
    this.wrapperWidth,
    required this.children,
  });

  @override
  FlexGridViewState createState() => FlexGridViewState();
}

// ignore: must_be_immutable
class FlexGridViewState extends State<FlexGridView> {
  late List<List<Widget>> processedItems;

  bool getIsReady(BuildContext context) {
    double bound = (widget.wrapperWidth != null)
        ? widget.wrapperWidth as double
        : MediaQuery.of(context).size.width;

    int columns = (bound / this.widget.maxColumnWidth).floor();
    columns = columns == 0 ? 1 : columns;

    final lenght = (this.widget.children.length / columns).ceil();
    List<List<Widget>> newProcessedItems = [];
    for (int i = 0; i < this.widget.children.length; i++) {
      if (i % lenght == 0) {
        newProcessedItems.add([]);
      }
      newProcessedItems.last.add(this.widget.children[i]);
    }

    this.processedItems = newProcessedItems;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (!getIsReady(context))
      return Expanded(child: Center(child: CircularProgressIndicator()));

    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this
              .processedItems
              .map(
                (e) => Expanded(
                  child: Column(
                    children: e,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
