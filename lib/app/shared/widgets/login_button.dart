import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/dimensions.dart';
import 'package:payflow/app/shared/themes/images.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/themes/styles.dart';

class GoogleLoginButton extends StatelessWidget with Dimensions {

  final VoidCallback onTap;

  const GoogleLoginButton({ Key? key, required this.onTap }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: widthGoogleLoginButton,
          height: heightGoogleLoginButton,
          decoration: BoxDecoration(
            color: ColorPalette.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(BorderSide(
              color: ColorPalette.stroke, 
            )),
          ),
          child: Row(
            children: [
              Container(
                width: heightGoogleLoginButton,
                height: heightGoogleLoginButton,
                alignment: Alignment.center,
                child: Image.asset(ImagePaths.google),
              ),
              Container(
                width: 1,
                color: ColorPalette.stroke,
              ),
              Expanded(
                flex: 6,
                child: Center(
                  child: Text(
                    "Entrar com Google",
                    style: TextStyles.buttonGray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}