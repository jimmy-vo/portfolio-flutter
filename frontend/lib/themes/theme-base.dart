import 'dart:ui';
import 'package:flutter/material.dart';

abstract class IsCustomTheme {
  late TextStyle cardHeaderStyle;
  late TextStyle indicatorTextNormalStyle;
  late TextStyle indicatorTextSelectedStyle;
  late TextStyle indicatorTextHoverStyle;
  late TextStyle titleStyle;
  late TextStyle organizationStyle;
  late TextStyle dateStyle;
  late TextStyle locationStyle;
  late TextStyle descritionTextStyle;
  late TextStyle descritionBulletStyle;
  late TextStyle socialLabelStyle;
  late TextStyle linkTextStyle;
  late ColorFilter navColorFilter;
  AssetImage navBackground = AssetImage("img/nav-blue.jpg");

  IsCustomTheme() {
    this.navColorFilter = this.getNavColorFilter();
    this.cardHeaderStyle = TextStyle(
      fontSize: getHeaderSize(),
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: getCardHeaderColor(),
    );
    this.indicatorTextNormalStyle = TextStyle(
      fontSize: getIndicatorTextSize(),
      fontWeight: FontWeight.w900,
      color: getIndicatorTextNormalColor(),
    );
    this.indicatorTextSelectedStyle = TextStyle(
      fontSize: getIndicatorTextSize(),
      fontWeight: FontWeight.w900,
      color: getIndicatorTextSelectedColor(),
    );
    this.indicatorTextHoverStyle = TextStyle(
      fontSize: getIndicatorTextSize(),
      fontWeight: FontWeight.w900,
      color: getIndicatorTextHoverColor(),
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
  Color getIndicatorIconNormalColor();
  Color getIndicatorIconSelectedColor();
  Color getIndicatorIconHoverColor();
  Color getIndicatorTextNormalColor();
  Color getIndicatorTextSelectedColor();
  Color getIndicatorTextHoverColor();
  Color getTitleColor();
  Color getOrganizationColor();
  Color getDateColor();
  Color getLocationColor();
  Color getDescritionTextColor();
  Color getDescritionBulletColor();
  Color getSocialLabelColor();

  Color getBackgroundColor();
  ColorFilter getNavColorFilter();

  double getIndicatorTextSize() => 20;
  double getHeaderSize() => 30;
  double getTitleSize() => 20;
  double getInfoSize() => 18;
  double getNormalSize() => 16;
}
