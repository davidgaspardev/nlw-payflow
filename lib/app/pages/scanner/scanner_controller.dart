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

/// Scanner Controller
class ScannerController extends Controller {

  BuildContext? _context;

  void back() {
    Navigator.of(_context!).pop();
  }

  final errorNotifier = ValueNotifier<bool>(false);
  String _error = "";
  String get error => _error;

  // ==================== CAMERA ==================== //

  /// barcode scanning API, you can read data encoded using most standard barcode formats.
  /// See: https://developers.google.com/ml-kit/vision/barcode-scanning
  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
  
  CameraController? _cameraController;

  /// Load camera
  Future<CameraController> loadAvailableCamera() async {
    try {
      // Get all cameras available in the device
      final cameras = await availableCameras();
      // Get the back camera from cameras available
      final camera = cameras.firstWhere((CameraDescription cameraDescription) {
        return cameraDescription.lensDirection == CameraLensDirection.back;
      });
      // Create and initilize camera controller
      _cameraController = CameraController(
        camera, 
        ResolutionPreset.max, 
        enableAudio: false,
      );
      await _cameraController!.initialize();
    
      scanWithCamera();
      return _cameraController as CameraController;
    } catch(e) {
      throw Exception(e);
    }
  }

  Timer? timeout;

  void scanWithCamera() {
    if(errorNotifier.value) errorNotifier.value = false;
    _startScannerStream();

    if(timeout != null) timeout!.cancel();
    timeout = Timer(Duration(seconds: 10), ()  {
      _error = "Timeout de leitura de boleto";
      errorNotifier.value = true;
      timeout = null;
    });
  }

  void scanWithImagePicker() async {
    await _cameraController!.stopImageStream();
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarcode(inputImage);
  }

  void _startScannerStream() {
    // Check if already has stream in camera 
    if(_cameraController!.value.isStreamingImages == false) {
      _cameraController!.startImageStream((CameraImage cameraImage) async {
        
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
  }

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

  void toAddPage() {
    Navigator.of(_context!).pushReplacementNamed(AddPage.routeName);
  }

  // ==================== OVERRIDE ==================== //

  @override
  void init(BuildContext context) {
    _context ??= context;
  }

  @override
  void dispose() async {
    errorNotifier.dispose();
    await barcodeScanner.close();
    if(timeout != null) {
     timeout!.cancel();
     timeout = null;
    }
    if(_cameraController != null) {
      if(_cameraController!.value.isStreamingImages) await _cameraController!.stopImageStream();
      _cameraController!.dispose();
    }
  }
}