import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/themes/theme-base.dart';

class DartTheme extends IsCustomTheme {
  @override
  Color getCardHeaderColor() => Colors.white;

  @override
  Color getIndicatorIconNormalColor() => Colors.white;

  @override
  Color getIndicatorIconHoverColor() => Colors.blueAccent;

  @override
  Color getIndicatorIconSelectedColor() => Colors.greenAccent;

  @override
  Color getIndicatorTextNormalColor() => Colors.transparent;

  @override
  Color getIndicatorTextHoverColor() => Colors.blueAccent;

  @override
  Color getIndicatorTextSelectedColor() => Colors.greenAccent;

  @override
  Color getTitleColor() => Colors.white;

  @override
  Color getDateColor() => Colors.white;

  @override
  Color getDescritionBulletColor() => Colors.white;

  @override
  Color getDescritionTextColor() => Colors.white;

  @override
  Color getLocationColor() => Colors.white;

  @override
  Color getOrganizationColor() => Colors.white;

  @override
  Color getSocialLabelColor() => Colors.white;

  @override
  Color getBackgroundColor() => Colors.black;

  @override
  ColorFilter getNavColorFilter() =>
      ColorFilter.mode(Colors.black.withOpacity(.4), BlendMode.hardLight);

  @override
  Color getNavColor() {
    // TODO: implement getNavColor
    throw UnimplementedError();
  }
}
