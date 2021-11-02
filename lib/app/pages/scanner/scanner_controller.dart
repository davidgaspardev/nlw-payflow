/// Standard package
import 'dart:async';
/// External packages
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
/// Internal packages
import 'package:payflow/app/helpers/abstraction/controller.dart';
import 'package:payflow/app/pages/add/add_page.dart';
import 'package:payflow/app/pages/scanner/helpers/device_camera.dart';

/// Scanner Controller
class ScannerController extends Controller {

  BuildContext? _context;

  void back() {
    Navigator.of(_context!).pop();
  }

  // ==================== TIMEOUT ==================== //

  Timer? timeout;

  final timeoutNotifier = ValueNotifier<bool>(false);
  bool get isTimeoutNotification => timeoutNotifier.value;
  void showTimeoutNotification() {
    timeoutNotifier.value = true;
  }
  void hideTimeoutNotification() {
    timeoutNotifier.value = false;
    _startTimeout();
  }

  void _startTimeout() {
    if(timeout != null) timeout!.cancel();
    timeout = Timer(Duration(seconds: 10), ()  {
      showTimeoutNotification();
      timeout = null;
    });
  }

  // ==================== CAMERA ==================== //
  
  // CameraController? _cameraController;
  final camera = DeviceCamera();

  /// Load camera
  Future<CameraController> loadCamera() async {
    try {
      await camera.initialize();
      scanWithCamera();
      return camera.controller;
    } catch(e) {
      throw Exception(e);
    }
  }

  void scanWithCamera() {
    if(isTimeoutNotification) hideTimeoutNotification();
    _startScannerStream();
    _startTimeout();
  }

  void scanWithImagePicker() async {
    await camera.stopImageStream();
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      final inputImage = InputImage.fromFilePath(pickedFile.path);
      await scannerBarcode(inputImage);
    } else {
      scanWithCamera();
    }
  }

  void _startScannerStream() {
    camera.startImageStream((CameraImage cameraImage) async {
      try {
        // Convert the camera image to a byte array
        final WriteBuffer allBytes = WriteBuffer();
        for(Plane plane in cameraImage.planes) allBytes.putUint8List(plane.bytes);
        final bytes = allBytes.done().buffer.asUint8List();

        // Get the dimension of the image from the camera.
        final Size imageSize = Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

        final InputImageRotation inputImageRotation = InputImageRotation.Rotation_0deg;
        final InputImageFormat inputImageFormat = InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ?? InputImageFormat.YUV420;

        final planeData = cameraImage.planes.map((Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width
          );
        }).toList();

        final inputImageData = InputImageData(
          size: imageSize, 
          imageRotation: inputImageRotation, 
          inputImageFormat: inputImageFormat, 
          planeData: planeData,
        );

        final inputImageCamera = InputImage.fromBytes(
          bytes: bytes, 
          inputImageData: inputImageData,
        );

        await Future.delayed(Duration(seconds: 3));
        await scannerBarcode(inputImageCamera);
      } catch(e) {
        print(e);
      }
    });
  }

  void toAddPage() {
    Navigator.of(_context!).pushReplacementNamed(AddPage.routeName);
  }

  // ==================== SCANNER ==================== //

  /// barcode scanning API, you can read data encoded using most standard barcode formats.
  /// See: https://developers.google.com/ml-kit/vision/barcode-scanning
  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  Future<void> scannerBarcode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);
      var barcode;

      for(Barcode item in barcodes) barcode = item.value.displayValue;

      if(barcode != null) toAddPage();

    } catch(e) {
      print(e);
    }
  }

  // ==================== OVERRIDE ==================== //

  @override
  void init(BuildContext context) {
    _context ??= context;
  }

  @override
  void dispose() async {
    timeoutNotifier.dispose();
    if(timeout != null) {
     timeout!.cancel();
     timeout = null;
    }
    await barcodeScanner.close();
    await camera.dispose();
  }
}