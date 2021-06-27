import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/abstraction/controller.dart';

/// Scanner Controller
class ScannerController extends Controller {

  BuildContext? _context;

  void back() {
    Navigator.of(_context!).pop();
  }

  @override
  void init(BuildContext context) {
    _context ??= context;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

class ScannerStatus {

  final bool isAvailable;
  final String error;
  final String barcode;

  CameraController? cameraController;

  ScannerStatus({
    this.isAvailable = false,
    this.error = "",
    this.barcode = "",
    this.cameraController
  });

  factory ScannerStatus.available(CameraController controller) {
    return ScannerStatus(
      cameraController: controller,
      isAvailable: true,
    );
  }

  factory ScannerStatus.error(String error) {
    return ScannerStatus(error: error);
  }

  factory ScannerStatus.barcode(String barcode) {
    return ScannerStatus(barcode: barcode);
  }

  bool get hasError => error.isNotEmpty;
  bool get hasBarcode => error.isNotEmpty;
}