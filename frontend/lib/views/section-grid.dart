import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/item.dart';

// ignore: must_be_immutable
class SectionGridView extends StatefulWidget {
  late List<SectionItem> items;
  int maxColumnWidth;
  SectionGridView({required this.maxColumnWidth, required Section data}) {
    items = data.items ?? [];
  }
  @override
  SectionGridViewState createState() => SectionGridViewState();
}

// ignore: must_be_immutable
class SectionGridViewState extends State<SectionGridView> {
  late List<List<SectionItem>> processedItems;
  late double previousScreenWidth = 0;

  bool getIsReady(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    int columns = (screenWidth / this.widget.maxColumnWidth).floor();
    columns = columns == 0 ? 1 : columns;

    final lenght = (this.widget.items.length / columns).ceil();
    List<List<SectionItem>> newProcessedItems = [];
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
                    children: e.map((e) => ItemView(data: e)).toList(),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
