import 'package:flutter/material.dart';
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

class _LoginPageState extends State<LoginPage> {

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
            height: size.height * 0.39,
            color: ColorPalette.primary,
          ),

          // Person image
          Positioned(
            top: size.height * 0.0825,
            left: (size.width / 2) - ((size.height * 0.46) * 0.557 / 2),
            child: Container(
              height: size.height * 0.46,
              width: (size.height * 0.46) * 0.557,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePaths.person),
                  fit: BoxFit.contain,
                ),
              ),
              child: Container(
                height: size.height * 0.16,
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
            bottom: size.height * 0.075,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Logo icon
                Image.asset(
                  ImagePaths.logomini,
                  height: size.height * 0.054,
                ),

                // Title
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.025, bottom: size.height * 0.04),
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