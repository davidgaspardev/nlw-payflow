import 'package:flutter/material.dart';
import 'package:payflow/app/shared/themes/images.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/themes/styles.dart';

class GoogleLoginButton extends StatelessWidget {

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
          width: size.width * 0.75,
          height: size.height * 0.07,
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
                width: size.height * 0.07,
                height: size.height * 0.07,
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