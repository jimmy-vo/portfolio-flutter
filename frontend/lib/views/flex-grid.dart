import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlexGridView<T> extends StatefulWidget {
  List<T> items;
  int maxColumnWidth;
  double? wrapperWidth;
  Widget Function(T) builder;
  FlexGridView({
    required this.maxColumnWidth,
    this.wrapperWidth,
    required this.items,
    required this.builder,
  });

  @override
  FlexGridViewState<T> createState() => FlexGridViewState<T>();
}

// ignore: must_be_immutable
class FlexGridViewState<T> extends State<FlexGridView> {
  late List<List<T>> processedItems;

  bool getIsReady(BuildContext context) {
    double bound = (widget.wrapperWidth != null)
        ? widget.wrapperWidth as double
        : MediaQuery.of(context).size.width;

    int columns = (bound / this.widget.maxColumnWidth).floor();
    columns = columns == 0 ? 1 : columns;

    final lenght = (this.widget.items.length / columns).ceil();
    List<List<T>> newProcessedItems = [];
    for (int i = 0; i < this.widget.items.length; i++) {
      if (i % lenght == 0) {
        newProcessedItems.add([]);
      }
      newProcessedItems.last.add(this.widget.items[i]);
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
                    children: e.map((e) => widget.builder(e)).toList(),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
