import 'package:flutter/material.dart';
import 'package:payflow/app/pages/home/home_page.dart';
import 'package:payflow/app/pages/login/login_page.dart';

class AuthController {

  var _isAuthenticated = false;
  var _user;

  get user => _user;
  get isAuthenticated => _isAuthenticated;

  void setUser(BuildContext context, var user) {
    if(user != null) {
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }
}