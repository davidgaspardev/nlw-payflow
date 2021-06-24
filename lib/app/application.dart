/// External package
import 'package:flutter/material.dart';
/// Internal packages
import 'package:payflow/app/helpers/dimensions.dart';
import 'package:payflow/app/pages/home/home_page.dart';
import 'package:payflow/app/pages/login/login_page.dart';
import 'package:payflow/app/pages/splash/splash_page.dart';
import 'package:payflow/app/shared/themes/palette.dart';

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primaryColor: ColorPalette.primary
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        SplashPage.routeName: (BuildContext context) {
          Dimensions.init(context);
          return SplashPage();
        },
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
      },
    );
  }
}