import 'package:flutter/material.dart';
import 'package:frontend/layouts/sidebar-layout.dart';
import 'dart:html' as html;

class RouteController extends ChangeNotifier {
  static const String PROFILE = "Profile";

  String currentPageName = '';
  String currentId = '';
  String? targetId = null;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print(settings);
    List<String> pathComponents = (settings.name ?? "/").split('/');
    String path = '/${pathComponents[1]}';
    switch (path) {
      case PROFILE:
        return _getPageRoute(SideBarLayout(), path, null);
      default:
        return _getPageRoute(SideBarLayout(), '/', null);
    }
  }

  void _pushRoute() {
    html.window.history
        .pushState(null, "Home", "${PROFILE}#section-${currentId}");
  }

  void notifyId(String id) {
    if (id != currentId) {
      currentId = id;
      _pushRoute();
    }
  }

  void notifyHorizontalSlidable(String pageName) {
    if (currentPageName != pageName) {
      currentPageName = pageName;
      this.notifyListeners();
    }
  }

  NoAnimationMaterialPageRoute _getPageRoute(
    Widget widget,
    String path,
    String? parameter,
  ) =>
      NoAnimationMaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: '$path/${parameter ?? ""}'),
      );
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
