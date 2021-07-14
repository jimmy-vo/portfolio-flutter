import 'package:flutter/material.dart';
import 'package:frontend/controllers/route.controller.dart';
import 'package:frontend/layouts/responsive.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/views/profile/item.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: must_be_immutable
class HorizontalSlidablePageFragment extends StatelessWidget {
  Widget? child;
  String fragment;

  HorizontalSlidablePageFragment({
    required this.child,
    required this.fragment,
  });

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

  static HorizontalSlidablePageFragment Spacer() =>
      HorizontalSlidablePageFragment(
        child: Container(height: 40),
        fragment: "#null",
      );

  static HorizontalSlidablePageFragment FromItemView(
          {required ItemView child}) =>
      HorizontalSlidablePageFragment(
        child: child,
        fragment: child.sectionItem.fragment,
      );
}

// ignore: must_be_immutable
abstract class IsHorizontalSlidablePage extends StatefulWidget {
  late IconData icon;
  late String name;
  late List<HorizontalSlidablePageFragment> children;
  List<String> getFragments();
}

// ignore: must_be_immutable
class HorizontalSlidablePage extends StatefulWidget
    implements IsHorizontalSlidablePage {
  IconData icon;
  String name;

  List<HorizontalSlidablePageFragment> children;
  late List<String> _fragments = [];

  HorizontalSlidablePage({
    Key? key,
    required this.icon,
    required this.name,
    required this.children,
  }) {
    children.insert(0, HorizontalSlidablePageFragment.Spacer());
    children.add(HorizontalSlidablePageFragment.Spacer());
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
          .map(
            (e) => HorizontalSlidablePageFragment.FromItemView(
              child: ItemView(
                sectionItem: e,
                sectionId: section.id,
              ),
            ),
          )
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
    return Selector<RouteController, RouteController>(
      selector: (_, RouteController controller) => controller,
      builder: (_, RouteController controller, __) {
        return FutureBuilder(
          future: load(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            // remove listener
            itemPositionsListener.itemPositions
                .removeListener(scrollCallback(controller));

            // add listener
            itemPositionsListener.itemPositions
                .addListener(scrollCallback(controller));

            controller.fragment.addListener(
              name: widget.name,
              pageFragments: widget.children,
              itemScrollController: itemScrollController,
            );

            return snapshot.data as Widget;
          },
        );
      },
    );
  }

  void Function() scrollCallback(RouteController controller) =>
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
