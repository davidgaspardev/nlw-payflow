import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/app/auth/auth_controller.dart';
import 'package:payflow/app/models/user_model.dart';

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
      if(googleUser == null) throw Exception("User is null");
      final user = UserModel(name: googleUser.displayName!, picture: googleUser.photoUrl);
      authController.setUser(context, user);
    } catch(e) {
      print(e);
    }
  }

}