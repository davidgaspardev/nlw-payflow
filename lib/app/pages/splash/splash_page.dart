/// External package
import 'package:flutter/material.dart';
import 'package:payflow/app/pages/home/home_page.dart';
import 'package:payflow/app/pages/login/login_page.dart';
import 'package:payflow/app/services/auth.dart';
/// Internal packages
import 'package:payflow/app/shared/themes/images.dart';
import 'package:payflow/app/shared/themes/palette.dart';

class SplashPage extends StatelessWidget {

  /// Location of the page in the [MaterialApp] route engine
  static final String routeName = "/splash";

  @override
  Widget build(BuildContext context) {

    final auth = AuthService();

    auth.hasUser().then((hasUser) async {

      await Future.delayed(Duration(seconds: 5));

      Navigator.of(context).pushReplacementNamed(hasUser ? HomePage.routeName : LoginPage.routeName);
    });

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