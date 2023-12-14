import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:get/get.dart';

class TextRecognizeController extends GetxController {
  static TextRecognizeController get to => Get.find<TextRecognizeController>();

  RxList<String> listDoc = [
    "KTP",
    "SIM",
    "Passport",
    "Math Calculation",
    "Document",
  ].obs;

  late CameraController cameraController;
  late List<CameraDescription> cameras;

  void initializeCamera() async {
    try {
      cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      cameraController.initialize();
    } catch (e) {
      log('Error to initialize camera: $e');
    }
  }

  @override
  void onInit() {
    initializeCamera();
    super.onInit();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
