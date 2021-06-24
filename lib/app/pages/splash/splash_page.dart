/// External package
import 'package:flutter/material.dart';
import 'package:payflow/app/auth/auth_controller.dart';
/// Internal packages
import 'package:payflow/app/shared/themes/images.dart';
import 'package:payflow/app/shared/themes/palette.dart';

class SplashPage extends StatelessWidget {

  /// Location of the page in the [MaterialApp] route engine
  static final String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    print("splash");
    final authController = AuthController();
    authController.currentUser(context);
    return Container(
      color: ColorPalette.background,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(ImagePaths.union),
          Image.asset(ImagePaths.logoFull)
        ],
      ),
    );
  }
}