import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/dimensions.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/themes/styles.dart';

/// App Bar
class AppBar extends StatelessWidget with Dimensions {

  static int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightHomeAppBar,
      color: ColorPalette.background,
      child: Stack(
        children: [

          Container(
            width: widthScreen,
            height: heightHomeOrangeBlock,
            color: ColorPalette.primary,
          ),

          Positioned(
            bottom: 0,
            left: widthScreen / 2 - widthHomeCounter / 2,
            child: Container(
              width: widthHomeCounter,
              height: heightHomeCounter,
              color: Colors.grey,
            ),
          ),

          Positioned(
            top: topHomeUser,
            child: Container(
              width: widthScreen,
              child: Material(
                color: Colors.transparent,
                child: ListTile(
                  title: Text.rich(TextSpan(
                      text: "Olá, ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                            text: "David Gaspar",
                            style: TextStyles.titleBoldBackground)
                      ])),
                  subtitle: Text(
                    "Mantenha suas contas em dia",
                    style: TextStyles.captionShape,
                  ),
                  trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/37712275?s=88&u=090b5c7ca005baf31e6e3b434c6a6710ca703fd7&v=4"
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}