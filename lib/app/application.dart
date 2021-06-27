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
        primarySwatch: Colors.orange,
        primaryColor: ColorPalette.primary
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
        SplashPage.routeName: (BuildContext context) {
          Dimensions.init(context);
          return SplashPage();
        },
      },
    );
  }
}