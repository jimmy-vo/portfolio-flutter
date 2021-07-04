import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/themes/theme-base.dart';

class LightTheme extends IsCustomTheme {
  LightTheme() : super();

  @override
  Color getCardHeaderColor() => Colors.black;

  @override
  Color getIndicatorIconNormalColor() => Colors.black;

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
  Color getTitleColor() => Colors.black;

  @override
  Color getDateColor() => Colors.black;

  @override
  Color getDescritionBulletColor() => Colors.black;

  @override
  Color getDescritionTextColor() => Colors.black;

  @override
  Color getLocationColor() => Colors.black;

  @override
  Color getOrganizationColor() => Colors.black;

  @override
  Color getSocialLabelColor() => Colors.black;

  @override
  Color getBackgroundColor() => Colors.white;

  @override
  Color getButtonColor() => Colors.black.withOpacity(0.01);

  @override
  ColorFilter getNavColorFilter() =>
      ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.hardLight);
}
