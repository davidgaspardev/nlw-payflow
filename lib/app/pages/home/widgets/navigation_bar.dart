/// External package
import 'package:flutter/material.dart';
/// Internal package
import 'package:payflow/app/helpers/dimensions.dart';
import 'package:payflow/app/pages/home/home_controller.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/widgets/provider.dart';

/// Navigation Bar
class NavigationBar extends StatelessWidget with Dimensions {

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<HomeController>(context);

    return Material(
      color: Colors.transparent,
      child: Container(
        width: widthScreen,
        height: heightHomeNavigationBar,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0x00FFFFFF),
              Color(0xFFFFFFFF)
            ]
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: widthHomeNaviagtionBarContent,
          height: heightHomeNavigationBarContent,
          margin: EdgeInsets.only(bottom: marginHomeNavigationBarContent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: IconButton(
                  onPressed: controller.myInvoices, 
                  icon: Icon(Icons.book),
                ),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: controller.toScan,
                    child: Container(
                      width: heightHomeNavigationBarContent,
                      height: heightHomeNavigationBarContent,
                      decoration: BoxDecoration(
                        color: ColorPalette.primary,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Icon(
                        Icons.add_a_photo_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ),
              Container(
                child: IconButton(
                  onPressed: controller.myExtracts, 
                  icon: Icon(Icons.book),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}