import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/app/auth/auth_controller.dart';

class LoginController {

  final authController = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    final GoogleSignIn login = GoogleSignIn(
      scopes: [
        'email'
      ]
    );

    try {
      final GoogleSignInAccount? googleUser = await login.signIn();
      authController.setUser(context, googleUser);
    } catch(e) {
      print(e);
    }
  }

}