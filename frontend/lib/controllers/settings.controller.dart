import 'package:frontend/controllers/base.controller.dart';
import 'package:frontend/models/setting-nav-enable.dart';
import 'package:frontend/models/setting-nav-position.dart';
import 'package:frontend/models/setting-nav-select-on-hover.dart';
import 'package:frontend/models/setting-themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends BaseController {
  late SharedPreferences _prefs;
  late NavPosition? navPosition;
  late NavSelectOnHover? navHover;
  late NavEnable? navEnable;
  late SettingsThemes? theme;
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
    this.navEnable = NavEnable.fromStorage(this._prefs);
    this.theme = SettingsThemes.fromStorage(this._prefs);
    this.isReady = true;
  }

  void setNavPosition(NavPositionValue value) {
    this.navPosition!.value = value;
    this.navPosition!.toStorage();
    notifyListeners();
  }

  void setTheme(SettingsThemeValue value) {
    this.theme!.value = value;
    this.theme!.toStorage();
    notifyListeners();
  }

  void setNavHover(bool value) {
    this.navHover!.value = value;
    this.navHover!.toStorage();
    notifyListeners();
  }

  void setNavEnable(bool value) {
    this.navEnable!.value = value;
    this.navEnable!.toStorage();
    notifyListeners();
  }
}
