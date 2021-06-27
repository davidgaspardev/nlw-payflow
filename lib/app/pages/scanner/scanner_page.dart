import 'package:flutter/material.dart' hide BottomSheet;
import 'package:payflow/app/pages/scanner/scanner_controller.dart';
import 'package:payflow/app/pages/scanner/widgets/bottom_sheet.dart';
import 'package:payflow/app/pages/scanner/widgets/header.dart';
import 'package:payflow/app/pages/scanner/widgets/set_label.dart';
import 'package:payflow/app/shared/widgets/provider.dart';

class ScannerPage extends StatelessWidget {

  /// Location of the page in the [MaterialApp] route engine
  static final routeName = "/scanner";

  final controller = ScannerController();

  @override
  Widget build(BuildContext context) {

    return Provider(
      useMaterial: true,
      controller: controller, 
      page: page,
    );
  }

  Widget page() { 

    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Stack(
          children: [
            controls(),
            BottomSheet(
              title: "Não foi possível identificar um código de barras.",
              subtitle: "Tente escanear novamente ou digite o código do seu boleto.",
              leftLabel: "Escanear novamente",
              leftOnPressed: () {},
              rightLabel: "Digitar código",
              rightOnPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget controls() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: Header(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: SetLabel(
                leftLabel: "Inserir código do boleto", 
                leftOnPressed: () {},
                rightLabel: "Adicionar da galeria", 
                rightOnPressed: () {}, 
              ),
            )
          ),
        ],
      ),
    );
  }
}