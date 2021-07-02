import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: must_be_immutable
class HorizontalSlidablePageChild extends StatelessWidget {
  Widget child;
  late String fragment;

  HorizontalSlidablePageChild(
      {required this.child,
      required num sectionId,
      required num sectionItemId}) {
    this.fragment = "#section-${sectionId}-${sectionItemId}";
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

// ignore: must_be_immutable
class HorizontalSlidablePage extends StatefulWidget {
  late IconData icon;
  late String name;
  late List<HorizontalSlidablePageChild> children;
  late List<String> _fragments = [];

  List<String> getFragments() {
    if (_fragments.length != children.length)
      _fragments = children.map((e) => e.fragment).toList();

    return _fragments;
  }

  @override
  _HorizontalSlidablePageState createState() => _HorizontalSlidablePageState();
}

class _HorizontalSlidablePageState extends State<HorizontalSlidablePage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  @override
  Widget build(BuildContext context) {
    return Consumer<RouteController>(
      builder: (_, RouteController controller, __) {
        return FutureBuilder(
          future: load(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            // remove listener
            itemPositionsListener.itemPositions
                .removeListener(listener(controller));

            // add listener
            itemPositionsListener.itemPositions
                .addListener(listener(controller));

            int index = controller.getHorizontalSlidablePageIndex(
                widget.name, widget.children);

            if (index == -1) return snapshot.data as Widget;

            SchedulerBinding.instance!.addPostFrameCallback((_) {
              itemScrollController.scrollTo(
                index: index,
                duration: Duration(seconds: 1),
              );
            });

            return snapshot.data as Widget;
          },
        );
      },
    );
  }

  void Function() listener(RouteController controller) =>
      () => controller.notifyFragment(
            widget.name,
            widget
                .children[itemPositionsListener.itemPositions.value.first.index]
                .fragment,
          );

  Future<Widget> load() async {
    // await Future.delayed(Duration(seconds: 4));
    // print("load " + this.widget.name);

    return ScrollablePositionedList.builder(
      itemBuilder: (BuildContext context, int index) => widget.children[index],
      itemCount: widget.children.length,
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
    );
  }
}
