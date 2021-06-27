/// External package
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
/// Internal package
import 'package:payflow/app/helpers/abstraction/controller.dart';
import 'package:payflow/app/models/user_data.dart';
import 'package:payflow/app/pages/home/home_page.dart';
import 'package:payflow/app/services/auth.dart';

/// Login Controller
class LoginController extends Controller {

  BuildContext? _context;
  final authService = AuthService();

  // ==================== SIGN IN ==================== //

  bool _signingIn = false;

  Future<void> signInGoogle() async {
    if(!_signingIn) {
      _signingIn = true;

      try {
        final GoogleSignIn googleSignIn = GoogleSignIn(
          scopes: [
            'email'
          ]
        );
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        // Checking if was a success 
        if(googleUser == null) throw Exception("Failed with google_sign_in");
        // Saving user
        await authService.saveUser(UserData(name: googleUser.displayName!, picture: googleUser.photoUrl!));
        // Navigate to home page
        Navigator.of(_context!).pushReplacementNamed(HomePage.routeName);
      } catch(e) {
        print(e);
        _signingIn = false;
      }
    }
  }

  // ==================== OVERRIDE ==================== //
  
  @override
  void init(BuildContext context) {
    _context ??= context;
  }
  
  @override
  void dispose() {
    _context = null;
  }
}