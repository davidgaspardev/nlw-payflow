/// External package
import 'package:flutter/material.dart' hide AppBar;
/// Internal packages
import 'package:payflow/app/helpers/dimensions.dart';
import 'package:payflow/app/pages/home/home_controller.dart';
import 'package:payflow/app/pages/home/widgets/app_bar.dart';
import 'package:payflow/app/pages/home/widgets/navigation_bar.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/widgets/provider.dart';

/// Home Page
class HomePage extends StatelessWidget with Dimensions {

  /// Location of the page in the [MaterialApp] route engine
  static final routeName = "/home";

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      controller: controller, 
      page: page,
    );
  }

  Widget page() {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorPalette.primary,
            ColorPalette.primary,
            ColorPalette.background,
            ColorPalette.background,
          ]
        ),
      ),
      child: Stack(
        children: [
          main(),

          Positioned(
            bottom: 0,
            child: NavigationBar()
          ),
        ],
      ),
    );
  }

  Widget main() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index == AppBar.index) return AppBar();
              return Container(
                color: Colors.white,
                height: 100,
              );
            }, 
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
