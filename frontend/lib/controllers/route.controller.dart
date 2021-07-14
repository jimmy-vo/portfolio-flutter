import 'package:flutter/material.dart';
import 'dart:html';

import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

enum FirstRoutePath { Profile }

class FragmentController {
  String _target = "";
  String _current = "";
  List<String> notifierNames = [];
  final ValueNotifier<String> notifier = ValueNotifier<String>("");

  FragmentController(Uri uri, String forceFragment) {
    this.notifier.value = forceFragment != ""
        ? forceFragment
        : (uri.fragment != "" ? "#${uri.fragment}" : "");

    _current = this.notifier.value;
    _target = this.notifier.value;
  }
  int _findIndex(List<HorizontalSlidablePageFragment> pageFragments) {
    int index = pageFragments
        .indexWhere((element) => element.fragment == this.notifier.value);
    print("FragmentController::_findIndex ${this.notifier.value}  ${index}");
    return index;
  }

  void addListener({
    required String name,
    required ItemScrollController itemScrollController,
    required List<HorizontalSlidablePageFragment> pageFragments,
  }) {
    if (notifierNames.contains(name)) return;
    print("FragmentController::addListener ${name}");
    notifierNames.add(name);
    notifier.addListener(() {
      int index = _findIndex(pageFragments);
      if (index != -1) {
        itemScrollController.scrollTo(
          index: index,
          duration: Duration(seconds: 1),
        );
        print("FragmentController::addListener scrollTo ${name} ${index}");
      }
    });
  }

  bool updateTarget(String fragment, bool Function() callback) {
    if (fragment == _target) return false;
    if (callback()) {
      print("FragmentController::updateTarget ${fragment} true");
      _target = fragment;
      return true;
    }
    print("FragmentController::updateTarget ${fragment} false");
    return false;
  }

  void notify() {
    if (_target == _current) return;
    print("FragmentController::notify ${_target}");
    this.notifier.value = _target;
  }

  bool updateCurrent(String fragment) {
    if (_current == fragment) return false;
    print("FragmentController::updateCurrent ${_current}");
    _current = fragment;
    return true;
  }

  String getCurrent() => _current;
}

class RouteController extends ChangeNotifier {
  FirstRoutePath _currentFirstRoutePath = FirstRoutePath.Profile;
  static const int initialPage = 0;
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(initialPage);
  final PageController pageController = PageController(
    initialPage: initialPage,
    viewportFraction: 0.999,
    keepPage: true,
  );
  List<IsHorizontalSlidablePage> horizontalSlidablePages = [];
  late FragmentController fragment;

  RouteController(Uri uri, String forceFragment) {
    this._setFirstRoutePath(
        uri.pathSegments.length > 0 ? uri.pathSegments[0] : "");
    this.fragment = FragmentController(uri, forceFragment);
    _pushRoute();
  }

  String _getFirstRoutePath() {
    return this
        ._currentFirstRoutePath
        .toString()
        .replaceAll('FirstRoutePath.', "");
  }

  void _setFirstRoutePath(String name) {
    this._currentFirstRoutePath = FirstRoutePath.values.firstWhere(
      (e) => e.toString() == 'PageName.' + name,
      orElse: () => FirstRoutePath.Profile,
    );
  }

  void _pushRoute() {
    String firstPath = this._getFirstRoutePath();
    String path = firstPath;
    String route = "${path}${this.fragment.getCurrent()}";
    // print("RouteController::_pushRoute ${route}");
    window.history.replaceState(null, "Home", route);
  }

  void setHorizontalSlidablePages(List<IsHorizontalSlidablePage> pages) =>
      this.horizontalSlidablePages = pages;

  void notifyFragment(String stackPageName, String fragment) {
    if (!this.fragment.updateCurrent(fragment)) return;
    print("RouteController::notifyFragment ${stackPageName} ${fragment}");
    _pushRoute();
  }

  void moveToPage(int index) {
    print("RouteController::moveToPage ${index}");
    pageController.animateToPage(
      index,
      duration: Duration(
          milliseconds: (250 * ((index - pageIndexNotifier.value)).abs() + 1)),
      curve: Curves.linear,
    );
  }

  void onPageChanged(int index) {
    print("RouteController::onPageChanged ${index}");
    pageIndexNotifier.value = index;
    fragment.notify();
  }

  void navigateToFragment(String fragment) {
    if (this.fragment.updateTarget(fragment, () {
      print("RouteController::navigateToFragment ${fragment}");
      List<int> indices = this
          .horizontalSlidablePages
          .map((element) =>
              element.getFragments().indexWhere((page) => page == fragment))
          .toList();

      int index = indices.indexWhere((element) => element >= 0);
      if (index == -1) return false;
      moveToPage(index);
      return true;
    })) {
      _pushRoute();
    }
  }

  static getCurrentUri() => Uri.parse(window.location.href);
}
