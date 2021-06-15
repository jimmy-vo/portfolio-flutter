import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/themes/theme-base.dart';

class DartTheme extends IsCustomTheme {
  @override
  Color getCardHeaderColor() => Colors.white;

  @override
  Color getIndicatorNormalColor() => Colors.transparent;

  @override
  Color getIndicatorHighlightColor() => Colors.blueAccent;

  @override
  Color getIndicatorSelectedColor() => Colors.greenAccent;

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
  Color getCardBackgroundColor() => Colors.white;
}
