/// External package
import 'package:flutter/material.dart';
/// Internal package
import 'package:payflow/app/helpers/dimensions.dart';
import 'package:payflow/app/pages/login/login_controller.dart';
import 'package:payflow/app/shared/themes/images.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/themes/styles.dart';
import 'package:payflow/app/shared/widgets/login_button.dart';
import 'package:payflow/app/shared/widgets/provider.dart';

/// Login Page
/// 
/// Page responsible for providing an introduction to the app's functionality 
/// and offers authentication with the Google service to use the app.
class LoginPage extends StatelessWidget with Dimensions {

  /// Location of the page in the [MaterialApp] route engine
  static final String routeName = "/login";

  /// Page controller
  final controller = LoginController();

  @override 
  Widget build(BuildContext context) {
    return Provider(
      controller: controller, 
      page: page
    );
  }

  Widget page() {
    return Container(
      color: ColorPalette.background,
      child: Stack(
        children: [

          // Orange block
          Container(
            width: widthScreen,
            height: heightLoginOrangeBlock,
            color: ColorPalette.primary,
          ),

          // Person image
          Positioned(
            top: topLoginPergon,
            left: leftLoginPeron,
            child: Container(
              height: heightLoginPerson,
              width: widthLoginPerson,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePaths.person),
                  fit: BoxFit.contain,
                ),
              ),
              child: Container(
                height: heightLoginPersonBottomEffect,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00FFFFFF),
                      ColorPalette.background
                    ]
                  )
                ),
              ),
            ),
          ),

          // Content
          Positioned(
            left: 0,
            right: 0,
            bottom: bottomLoginContent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Logo icon
                Image.asset(
                  ImagePaths.logomini,
                  height: heightLoginLogomini,
                ),

                // Title
                Padding(
                  padding: EdgeInsets.only(
                    top: topLoginTitle, 
                    bottom: bottomLoginTitle,
                  ),
                  child: Text(
                    "Organize seus\nboletos em um\nsó lugar",
                    textAlign: TextAlign.center,
                    style: TextStyles.titleHome,
                  ), 
                ),

                // Button
                GoogleLoginButton(
                  onTap: controller.signInGoogle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}