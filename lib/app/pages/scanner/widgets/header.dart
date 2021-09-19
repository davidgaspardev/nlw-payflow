import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/dimensions.dart';
import 'package:payflow/app/pages/scanner/scanner_controller.dart';
import 'package:payflow/app/shared/themes/styles.dart';
import 'package:payflow/app/shared/widgets/provider.dart';

class Header extends StatelessWidget with Dimensions {

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<ScannerController>(context);

    return Container(
      height: 50,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: controller.back, 
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Escaneie o código de barras do boleto",
                style: TextStyles.captionBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}