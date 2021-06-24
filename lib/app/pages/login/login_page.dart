import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/dimensions.dart';
import 'package:payflow/app/shared/themes/images.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/themes/styles.dart';
import 'package:payflow/app/shared/widgets/login_button.dart';

class LoginPage extends StatefulWidget {

  /// Location of the page in the [MaterialApp] route engine
  static final String routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Dimensions {

  @override 
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: ColorPalette.background,
      child: Stack(
        children: [

          // Orange block
          Container(
            width: size.width,
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
                  onTap: () {
                    print("Clicked");
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}