import 'package:flutter/material.dart';

mixin Dimensions {

  // ==================== BOOT SETTING ==================== //

  static Size _size = Size.zero;

  static void init(BuildContext context) {
    if(_size == Size.zero) _size = MediaQuery.of(context).size;
  }

  // ==================== HEIGHT ==================== //

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

  // ==================== WIDTH ==================== //

  /// 100% of screen width
  double get widthScreen => _size.width;

  /// 55.7% of [heightLoginPerson]
  double get widthLoginPerson => heightLoginPerson * 0.557;

  /// 75% of screen width
  double get widthGoogleLoginButton => widthScreen * 0.75;

  // ==================== TOP ==================== //

  /// 2.5% of screen height
  double get topLoginTitle => heightScreen * 0.025;

  /// 8.25% of screen height
  double get topLoginPergon => heightScreen * 0.0825;

  // ==================== BOTTOM ==================== //

  /// 7.5% of screen height
  double get bottomLoginContent => heightScreen * 0.075;

  /// 4% of screen height
  double get bottomLoginTitle => heightScreen * 0.04;

  // ==================== LEFT ==================== //

  double get leftLoginPeron => widthScreen / 2 - widthLoginPerson / 2;
}