import 'package:flutter/material.dart';
import 'dart:html';

import 'package:frontend/layouts/horizontal-slidable/template.dart';

enum FirstRoutePath { Profile }

class RouteController extends ChangeNotifier {
  FirstRoutePath _currentFirstRoutePath = FirstRoutePath.Profile;
  String currentStackPageName = "";
  String currentFragment = '';
  String targetFragment = '';

  RouteController(Uri uri) {
    this.setFirstRoutePath(
        uri.pathSegments.length > 0 ? uri.pathSegments[0] : "");
    this.targetFragment = uri.fragment != "" ? "#${uri.fragment}" : "";
    this.currentFragment = this.targetFragment;
    _pushRoute();
  }

  String getFirstRoutePath() {
    return this
        ._currentFirstRoutePath
        .toString()
        .replaceAll('FirstRoutePath.', "");
  }

  String getHorizontalSlidablePage() => this.currentStackPageName;

  int getHorizontalSlidablePageIndex(
      String stackPageName, List<HorizontalSlidablePageChild> children) {
    if (this.currentStackPageName != stackPageName) return -1;
    return children
        .indexWhere((element) => element.fragment == this.targetFragment);
  }

  int getTargetPageStack(List<HorizontalSlidablePage> children) {
    if (targetFragment == '') return 0;
    List<int> indices = children
        .map((element) => element
            .getFragments()
            .indexWhere((page) => page == this.targetFragment))
        .toList();

    int index = indices.indexWhere((element) => element >= 0);
    if (index == -1) {
      index = 0;
    }
    currentStackPageName = children[index].name;

    return index;
  }

  void setFirstRoutePath(String name) {
    this._currentFirstRoutePath = FirstRoutePath.values.firstWhere(
      (e) => e.toString() == 'PageName.' + name,
      orElse: () => FirstRoutePath.Profile,
    );
  }

  void _pushRoute() {
    String firstPath = this.getFirstRoutePath();
    String path = firstPath;
    window.history.replaceState(null, "Home", "${path}${currentFragment}");
  }

  void notifyFragment(String stackPageName, String fragment) {
    if (stackPageName != this.currentStackPageName) return;

    if (fragment != currentFragment) {
      currentFragment = fragment;
      _pushRoute();
    }
  }

  void notifyNewStackName(String stackName) {
    if (currentStackPageName != stackName) {
      print("currentStackPageName: ${currentStackPageName}");
      currentStackPageName = stackName;
      this.notifyListeners();
    }
  }
}
