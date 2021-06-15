import 'dart:ui';
import 'package:flutter/material.dart';

abstract class IsCustomTheme {
  late TextStyle cardHeaderStyle;
  late TextStyle indicatorNormalStyle;
  late TextStyle indicatorSelectedStyle;
  late TextStyle indicatorHighlightStyle;
  late TextStyle titleStyle;
  late TextStyle organizationStyle;
  late TextStyle dateStyle;
  late TextStyle locationStyle;
  late TextStyle descritionTextStyle;
  late TextStyle descritionBulletStyle;
  late TextStyle socialLabelStyle;
  late TextStyle linkTextStyle;

  IsCustomTheme() {
    this.cardHeaderStyle = TextStyle(
      fontSize: getHeaderSize(),
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: getCardHeaderColor(),
    );
    this.indicatorNormalStyle = TextStyle(
      fontSize: getIndicatorSize(),
      fontWeight: FontWeight.w900,
      color: getIndicatorNormalColor(),
    );
    this.indicatorSelectedStyle = TextStyle(
      fontSize: getIndicatorSize(),
      fontWeight: FontWeight.w900,
      color: getIndicatorSelectedColor(),
    );
    this.indicatorHighlightStyle = TextStyle(
      fontSize: getIndicatorSize(),
      fontWeight: FontWeight.w900,
      color: getIndicatorHighlightColor(),
    );
    this.titleStyle = TextStyle(
      fontSize: getTitleSize(),
      fontWeight: FontWeight.w900,
      color: getTitleColor(),
    );
    this.organizationStyle = TextStyle(
      fontSize: getInfoSize(),
      fontWeight: FontWeight.w600,
      color: getOrganizationColor(),
    );
    this.dateStyle = TextStyle(
      fontSize: getNormalSize(),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      color: getDateColor(),
    );
    this.locationStyle = TextStyle(
      fontSize: getNormalSize(),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      color: getLocationColor(),
    );
    this.descritionTextStyle = TextStyle(
      fontSize: getNormalSize(),
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: getDescritionTextColor(),
    );
    this.descritionBulletStyle = TextStyle(
      fontSize: getNormalSize(),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: getDescritionBulletColor(),
    );
    this.socialLabelStyle = TextStyle(
      fontSize: getNormalSize(),
      fontWeight: FontWeight.bold,
      color: getSocialLabelColor(),
    );
    this.linkTextStyle = TextStyle(
      fontSize: getNormalSize(),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      color: Colors.blue,
      decoration: TextDecoration.underline,
    );
  }

  Color getCardHeaderColor();
  Color getIndicatorNormalColor();
  Color getIndicatorSelectedColor();
  Color getIndicatorHighlightColor();
  Color getTitleColor();
  Color getOrganizationColor();
  Color getDateColor();
  Color getLocationColor();
  Color getDescritionTextColor();
  Color getDescritionBulletColor();
  Color getSocialLabelColor();

  Color getCardBackgroundColor();

  double getIndicatorSize() => 20;
  double getHeaderSize() => 30;
  double getTitleSize() => 20;
  double getInfoSize() => 18;
  double getNormalSize() => 16;
}
