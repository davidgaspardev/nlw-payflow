import 'package:camera/camera.dart';
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
            cameraImages(),            
            controls(),
            timeoutNotication()
          ],
        ),
      ),
    );
  }

  /// Widget responsible for showing the images coming from the camera
  Widget cameraImages() {
    return RotatedBox(
      quarterTurns: -1,
      child: FutureBuilder<CameraController>(
        future: controller.loadCamera(),
        builder: (BuildContext context, AsyncSnapshot<CameraController> asyncSnapshot) {
          if(asyncSnapshot.hasData) return asyncSnapshot.data!.buildPreview();
          return Container();
        },
      ),
    );
  }

  Widget controls() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(.5),
              alignment: Alignment.topCenter,
              child: Header(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(.5),
              alignment: Alignment.bottomCenter,
              child: SetLabel(
                leftLabel: "Inserir c??digo do boleto", 
                leftOnPressed: () {},
                rightLabel: "Adicionar da galeria", 
                rightOnPressed: controller.scanWithImagePicker, 
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget timeoutNotication() {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.timeoutNotifier, 
      builder: (_, limitedTime, __) {
        if(limitedTime) return BottomSheet(
          title: "N??o foi poss??vel identificar um c??digo de barras.",
          subtitle: "Tente escanear novamente ou digite o c??digo do seu boleto.",
          leftLabel: "Escanear novamente",
          leftOnPressed: controller.hideTimeoutNotification,
          rightLabel: "Digitar c??digo",
          rightOnPressed: controller.toAddPage,
        );
        
        return Container();
      }
    );
  }
}