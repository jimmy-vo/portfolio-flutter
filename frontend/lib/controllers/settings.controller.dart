import 'package:flutter/material.dart';
import 'package:frontend/models/setting-nav-hover.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController with ChangeNotifier {
  late SharedPreferences _prefs;
  late NavPosition? navPosition;
  late NavSelectOnHover? navHover;
  bool isReady = false;

  SettingsController() {
    this.setUp().then((value) => notifyListeners());
  }

  void notify() {
    notifyListeners();
  }

  Future setUp() async {
    this._prefs = await SharedPreferences.getInstance();
    this.navPosition = NavPosition.fromStorage(this._prefs);
    this.navHover = NavSelectOnHover.fromStorage(this._prefs);
    this.isReady = true;
  }

  void setNavPosition(NavPositionValue value) {
    this.navPosition!.value = value;
    this.navPosition!.toStorage();
    notifyListeners();
  }

  void setNavHover(bool value) {
    this.navHover!.value = value;
    this.navHover!.toStorage();
    notifyListeners();
  }
}
