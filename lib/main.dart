import 'package:flutter/material.dart';
import 'package:payflow/app/pages/login/login_page.dart';
import 'package:payflow/app/pages/splash/splash_page.dart';
import 'package:payflow/app/shared/themes/palette.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
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
        SplashPage.routeName: (BuildContext context) => SplashPage(),
        LoginPage.routeName: (BuildContext context) => LoginPage(),
      },
    );
  }
}

