import 'package:flutter/material.dart';
import 'dart:html';

import 'package:frontend/layouts/horizontal-slidable/template.dart';

enum FirstRoutePath { Profile }

class RouteController extends ChangeNotifier {
  FirstRoutePath _currentFirstRoutePath = FirstRoutePath.Profile;
  String currentStackPageName = "";
  String currentFragment = '';
  String targetFragment = '';

  RouteController() {
    Uri uri = Uri.parse(window.location.href);
    this.setFirstRoutePath(
        uri.pathSegments.length > 0 ? uri.pathSegments[0] : "");
    this.targetFragment = uri.fragment;

    // print(uri.fragment);
    // print(uri.queryParametersAll);
  }

  String getFirstRoutePath() {
    return this
        ._currentFirstRoutePath
        .toString()
        .replaceAll('FirstRoutePath.', "");
  }

  String getHorizontalSlidablePage() => this.currentStackPageName;

  bool checkgetHorizontalSlidablePage(String pageName) =>
      this.currentStackPageName == pageName;

  int getHorizontalSlidablePageIndex(
          List<HorizontalSlidablePageChild> children) =>
      children.indexWhere((element) => element.fragment == this.targetFragment);

  void setFirstRoutePath(String name) {
    this._currentFirstRoutePath = FirstRoutePath.values.firstWhere(
      (e) => e.toString() == 'PageName.' + name,
      orElse: () => FirstRoutePath.Profile,
    );
  }

  void _pushRoute() {
    String firstPath = this.getFirstRoutePath();
    String path = firstPath;
    window.history.pushState(null, "Home", "${path}${currentFragment}");
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
