import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payflow/app/helpers/abstraction/controller.dart';

/// Scanner Controller
class ScannerController extends Controller {

  BuildContext? _context;

  void back() {
    Navigator.of(_context!).pop();
  }

  final statusNotifier = ValueNotifier<ScannerStatus>(ScannerStatus());
  ScannerStatus get status => statusNotifier.value;
  set status(ScannerStatus status) => statusNotifier.value = status;

  // ==================== CAMERA ==================== //

  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  Future<void> loadAvailableCamera() async {
    try {
      // Get all cameras available in the device
      final cameras = await availableCameras();
      // Get the back camera from cameras available
      final camera = cameras.firstWhere((CameraDescription cameraDescription) {
        return cameraDescription.lensDirection == CameraLensDirection.back;
      });
      // Create controller to scanner status
      final cameraController = CameraController(
        camera, 
        ResolutionPreset.max, 
        enableAudio: false,
      );
      status = ScannerStatus.available(cameraController);
      scanWithCamera();
    } catch(e) {
      status = ScannerStatus.error(e.toString());
    }
  }

  void scanWithCamera() {
    Future.delayed(Duration(seconds: 10)).then((value) {
      if(status.cameraController != null && status.cameraController!.value.isStreamingImages) {
        status.cameraController!.stopImageStream();
      }
      status = ScannerStatus.error("Timeout de leitura de boleto");
    });
    listenCamera();
  }

  void scanWithImagePicker() async {
    await status.cameraController!.stopImageStream();
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarcode(inputImage);
  }

  void listenCamera() {
    if(status.cameraController!.value.isStreamingImages == false) {
      status.cameraController!.startImageStream((CameraImage cameraImage) async {
        try {
          // Convert the camera image to a byte array
          final WriteBuffer allBytes = WriteBuffer();
          for(Plane plane in cameraImage.planes) allBytes.putUint8List(plane.bytes);
          final bytes = allBytes.done().buffer.asUint8List();

          // Get the dimension of the image from the camera.
          final Size imageSize = Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

          final InputImageRotation inputImageRotation = InputImageRotation.Rotation_0deg;
          final InputImageFormat inputImageFormat = InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ?? InputImageFormat.NV21;

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
          scannerBarcode(inputImageCamera);
        } catch(e) {
          print(e);
        }
      });
    }
  }

  Future<void> scannerBarcode(InputImage inputImage) async {
    try {
      if(status.cameraController != null && status.cameraController!.value.isStreamingImages) {
        status.cameraController!.stopImageStream();
      }

      final barcodes = await barcodeScanner.processImage(inputImage);
      var barcode;

      for(Barcode item in barcodes) barcode = item.value.displayValue;

      if(barcode != null && status.barcode.isEmpty) {
        status = ScannerStatus.barcode(barcode);
        status.cameraController!.dispose();
      } else {
        loadAvailableCamera();
      }
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
  bool get hasBarcode => barcode.isNotEmpty;
  bool get showCamera => isAvailable;
}