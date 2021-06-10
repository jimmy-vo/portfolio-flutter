import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/views/card-group.dart';
import 'package:frontend/views/flex-grid.dart';
import 'package:frontend/views/item.dart';

// ignore: must_be_immutable
class RecentItems extends StatelessWidget {
  String title;
  List<SectionItem> items;
  int count;
  Function()? onPressed;

  RecentItems({
    required this.title,
    required this.items,
    required this.count,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CardGroup(
          title: title,
          child: FlexGridView(
            maxColumnWidth: 700,
            children: items
                .sublist(0, count)
                .map((e) => ItemView(
                      data: e,
                      hideDescription: onPressed != null,
                    ))
                .toList(),
          ),
        ),
        onPressed != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: OutlinedButton(
                  onPressed: onPressed,
                  child: Text("See " +
                      (this.items.length - this.count).toString() +
                      " more..."),
                ),
              )
            : Spacer()
      ],
    );
  }
}
