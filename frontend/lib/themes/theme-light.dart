import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/themes/theme-base.dart';

class LightTheme extends IsCustomTheme {
  LightTheme() : super();

  @override
  Color getCardHeaderColor() => Colors.black;

  @override
  Color getIndicatorNormalColor() => Colors.transparent;

  @override
  Color getIndicatorHighlightColor() => Colors.blueAccent;

  @override
  Color getIndicatorSelectedColor() => Colors.greenAccent;

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
  Color getCardBackgroundColor() => Colors.white;
}
