import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:frontend/layouts/responsive.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/item.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: must_be_immutable
class HorizontalSlidablePageChild extends StatelessWidget {
  Widget child;
  late String fragment;
  num? sectionId;
  num? sectionItemId;

  HorizontalSlidablePageChild({
    required this.child,
    required this.sectionId,
    required this.sectionItemId,
  }) {
    this.fragment = (this.sectionId != null || this.sectionItemId != null)
        ? "#section-${sectionId}-${sectionItemId}"
        : "";
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      buildLarge: (_, width) => Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Container(
            width: 1130,
            child: child,
          ),
        ),
      ),
      buildMedium: (_, width) => Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: child,
      ),
      buildSmall: (_, width) => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: child,
      ),
    );
  }
}

// ignore: must_be_immutable
abstract class IsHorizontalSlidablePage extends StatefulWidget {
  late IconData icon;
  late String name;
  late List<HorizontalSlidablePageChild> children;
  List<String> getFragments();
}

// ignore: must_be_immutable
class HorizontalSlidablePage extends StatefulWidget
    implements IsHorizontalSlidablePage {
  IconData icon;
  String name;
  List<HorizontalSlidablePageChild> children;
  late List<String> _fragments = [];

  HorizontalSlidablePage({
    Key? key,
    required this.icon,
    required this.name,
    required this.children,
  }) {
    children.insert(
      0,
      HorizontalSlidablePageChild(
        child: Container(
          height: 60,
        ),
        sectionId: null,
        sectionItemId: null,
      ),
    );
    children.add(
      HorizontalSlidablePageChild(
        child: Container(
          height: 60,
        ),
        sectionId: null,
        sectionItemId: null,
      ),
    );
  }

  List<String> getFragments() {
    if (_fragments.length != children.length)
      _fragments = children.map((e) => e.fragment).toList();

    return _fragments;
  }

  @override
  _HorizontalSlidablePageState createState() => _HorizontalSlidablePageState();

  static HorizontalSlidablePage fromSection(
      {required Section section, required IconData icon}) {
    return HorizontalSlidablePage(
      children: section.items!
          .map((e) => HorizontalSlidablePageChild(
                sectionId: section.id,
                sectionItemId: e.id,
                child: ItemView(data: e),
              ))
          .toList(),
      icon: icon,
      name: section.name!,
    );
  }
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
    return ScrollablePositionedList.builder(
      itemCount: widget.children.length,
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: widget.children[index],
      ),
    );
  }
}
