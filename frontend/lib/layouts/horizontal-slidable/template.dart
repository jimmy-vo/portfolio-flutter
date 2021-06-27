import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: must_be_immutable
class HorizontalSlidablePageChild extends StatelessWidget {
  String id;
  Widget child;

  HorizontalSlidablePageChild({
    required this.id,
    required this.child,
  });

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
            if (snapshot.hasData) {
              // remove listener
              itemPositionsListener.itemPositions
                  .removeListener(listener(controller));

              // remove listener
              itemPositionsListener.itemPositions
                  .addListener(listener(controller));

              Widget child = snapshot.data as Widget;

              if (controller.currentPageName == widget.name) return child;

              if (controller.targetId == null) return child;

              int index = widget.children.indexWhere(
                  (element) => element.id.toString() == controller.targetId);

              if (index == -1) return child;

              SchedulerBinding.instance!.addPostFrameCallback((_) {
                itemScrollController.scrollTo(
                  index: index,
                  duration: Duration(seconds: 1),
                );
              });

              return snapshot.data as Widget;
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }

  void Function() listener(RouteController controller) => () {
        if (controller.currentPageName == widget.name) {
          controller.notifyId(widget
              .children[itemPositionsListener.itemPositions.value.first.index]
              .id);
        }
      };

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
