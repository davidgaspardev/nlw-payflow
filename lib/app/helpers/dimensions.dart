import 'package:flutter/material.dart';

mixin Dimensions {

  // ==================== BOOT SETTING ==================== //

  static Size _size = Size.zero;
  static double _heightStatusBar = 0;

  static void init(BuildContext context) {
    if(_size == Size.zero) {
      _size = MediaQuery.of(context).size;
      _heightStatusBar = MediaQuery.of(context).padding.top;
    }
  }

  // ==================== HEIGHT ==================== //

  double get heightStatusBar => _heightStatusBar;

  /// 100% of screen height
  double get heightScreen => _size.height;

  /// 39% of screen height
  double get heightLoginOrangeBlock => heightScreen* 0.39; 

  /// 46% of screen height
  double get heightLoginPerson => heightScreen * 0.46;

  /// 16% of screen height
  double get heightLoginPersonBottomEffect => heightScreen * 0.16;

  /// 5.4% of screen height
  double get heightLoginLogomini => heightScreen * 0.054;

  /// 7% of screen height
  double get heightGoogleLoginButton => heightScreen * 0.07;

  /// 59% of screen width
  double get heightHomeAppBar => widthScreen * 0.59;

  /// 82% of [heightHomeAppBar]
  double get heightHomeOrangeBlock => heightHomeAppBar * 0.82;

  /// 24% of [widthHomeCounter]
  double get heightHomeCounter => widthHomeCounter * 0.24;

  /// 39.5% of screen width
  double get heightHomeNavigationBar => widthScreen * 0.395;

  /// 37.5% of [heightHomeNavigationBar]
  double get heightHomeNavigationBarContent => heightHomeNavigationBar * 0.375;

  // ==================== WIDTH ==================== //

  /// 100% of screen width
  double get widthScreen => _size.width;

  /// 55.7% of [heightLoginPerson]
  double get widthLoginPerson => heightLoginPerson * 0.557;

  /// 75% of screen width
  double get widthGoogleLoginButton => widthScreen * 0.75;

  /// 87% of screen width
  double get widthHomeCounter => widthScreen * 0.87;

  /// 30.5% of [widthHomeCounter]
  double get widthHomeCounterIcon => widthHomeCounter * 0.305;

  /// 58% of screen width
  double get widthHomeNaviagtionBarContent => widthScreen * 0.58;

  // ==================== MARGIN ==================== //

  /// 24% of [heightHomeNavigationBar]
  double get marginHomeNavigationBarContent => heightHomeNavigationBar * 0.24;

  // ==================== TOP ==================== //

  /// 2.5% of screen height
  double get topLoginTitle => heightScreen * 0.025;

  /// 8.25% of screen height
  double get topLoginPergon => heightScreen * 0.0825;

  /// 7.8% of screen height
  double get topHomeUser => heightScreen * 0.078;

  // ==================== BOTTOM ==================== //

  /// 7.5% of screen height
  double get bottomLoginContent => heightScreen * 0.075;

  /// 4% of screen height
  double get bottomLoginTitle => heightScreen * 0.04;

  // ==================== LEFT ==================== //

  double get leftLoginPeron => widthScreen / 2 - widthLoginPerson / 2;

  // ==================== RADIUS ==================== //

  /// 7.5% of [heightHomeCounter]
  double get radiusHomeCounter => heightHomeCounter * 0.075;
}