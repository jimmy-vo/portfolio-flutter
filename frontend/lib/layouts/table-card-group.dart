import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/layouts/card-group.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:frontend/views/profile/item.dart';

// ignore: must_be_immutable
class TableCardGroup extends StatefulWidget {
  String title;
  List<ItemView> children;
  int column;
  bool collapsed;
  late List<List<Widget>> newProcessedItems = [];

  TableCardGroup({
    required this.title,
    required this.children,
    required this.column,
    this.collapsed = true,
  }) {
    for (int i = 0; i < this.children.length; i++) {
      if (i % column == 0) {
        newProcessedItems.add([]);
      }
      newProcessedItems.last.add(this.children[i]);
    }

    for (int i = 0;
        i < newProcessedItems.first.length - newProcessedItems.last.length;
        i++) {
      newProcessedItems.last.add(Spacer());
    }
  }

  @override
  State<StatefulWidget> createState() => TableCardGroupState();
}

// ignore: must_be_immutable
class TableCardGroupState extends State<TableCardGroup> {
  Widget buildIcon({
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return ElevatedButton(
      onPressed: () => {
        setState(() {
          onPressed();
        })
      },
      child: Icon(
        iconData,
        color: ThemeManager.instance!.getTitleColor(),
      ),
      style: ThemeManager.instance!.buttonStyle,
    );
  }

  Widget buildExpanded() {
    return Table(
      children:
          widget.newProcessedItems.map((e) => TableRow(children: e)).toList(),
    );
  }

  Widget buildCollapsed() {
    return Table(
      children: [
        TableRow(children: widget.newProcessedItems.first),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        CardGroup(
          title: widget.title,
          child: Column(
            children: [
              AnimatedCrossFade(
                firstChild: buildCollapsed(),
                secondChild: buildExpanded(),
                crossFadeState: !widget.collapsed
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 400),
              ),
              Container(
                height: 20,
              )
            ],
          ),
        ),
        ...widget.newProcessedItems.length <= 1
            ? []
            : [
                Positioned(
                  bottom: -10,
                  child: buildIcon(
                    onPressed: () {
                      widget.collapsed = !widget.collapsed;
                    },
                    iconData: widget.collapsed
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up,
                  ),
                )
              ],
      ],
    );
  }
}
