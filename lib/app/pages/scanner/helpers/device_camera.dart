import 'package:camera/camera.dart';
export 'package:camera/camera.dart' show CameraLensDirection;

///This object is responsible for communicating with the device's cameras
/// through the Camera plugin offered by Flutter
class DeviceCamera {
  static final _cache = <CameraLensDirection, DeviceCamera>{};

  DeviceCamera._internal(
    this.lensDirection, {
    required this.resolution,
    required this.enableAdudio,
  });
  final CameraLensDirection lensDirection;
  final ResolutionPreset resolution;
  final bool enableAdudio;

  factory DeviceCamera({
    CameraLensDirection lensDirection = CameraLensDirection.back,
    ResolutionPreset resolution = ResolutionPreset.max,
    bool enableAudio = false,
  }) {
    if (_cache.containsKey(lensDirection)) {
      // Retrieving cached instance
      return _cache[lensDirection]!;
    } else {
      // Creating instance
      final deviceCamera = DeviceCamera._internal(
        lensDirection,
        resolution: resolution,
        enableAdudio: enableAudio,
      );
      // Saving instace in cache
      _cache[lensDirection] = deviceCamera;
      return deviceCamera;
    }
  }

  late final CameraController controller;

  bool _initialized = false;
  void _isInitialized() {
    if (!_initialized)
      throw Exception("Device camera ($lensDirection) not initialized");
  }

  Future<CameraDescription> _loadCamera() async {
    // Get all cameras available in the device
    final cameras = await availableCameras();

    // Get the back camera from camera avalabled
    CameraDescription? camera;
    for (int i = 0; i < cameras.length; i++) {
      if (cameras[i].lensDirection == lensDirection) {
        camera = cameras[i];
        break;
      }
    }

    if (camera == null)
      throw Exception("This camera ($lensDirection) isn't avalable");
    return camera;
  }

  bool _isInitializationInProcess = false;
  Future<void> initialize() async {
    if (!_initialized && !_isInitializationInProcess) {
      _isInitializationInProcess = true;

      final camera = await _loadCamera();

      controller =
          CameraController(camera, resolution, enableAudio: enableAdudio);

      await controller.initialize();

      _isInitializationInProcess = false;
      _initialized = true;
    }
  }

  bool get isStreamingImages => controller.value.isStreamingImages;

  Future<void> startImageStream(Function(CameraImage) imageProccess) async {
    // Check inicialization
    _isInitialized();
    if (!isStreamingImages) await controller.startImageStream(imageProccess);
  }

  Future<void> stopImageStream() async {
    // Check inicialization
    _isInitialized();
    if (isStreamingImages) await controller.stopImageStream();
  }

  Future<void> dispose() async {
    await stopImageStream();
    await controller.dispose();
    _initialized = false;
  }
}
