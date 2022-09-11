import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchCameraController extends GetxController {
  late CameraController controller;
  FlashMode? currentFlashMode;
  String? path;
  Widget flashIcon = const Icon(
    Icons.flash_off,
    size: 30,
  );
  bool isRearCameraSelected = true;
  late Future<void> initializeControllerFuture;


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void initCamera(CameraDescription cameraDescription) async {
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    initializeControllerFuture = controller.initialize();
  }


  void takePicture() async {
    try {
      await initializeControllerFuture;
      final image = await controller.takePicture();
      path = image.path;
      update();
      Get.toNamed("search/camera/preview");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void flashAction() async {
    if (kDebugMode) {
      print(currentFlashMode);
    }
    switch (currentFlashMode) {
      case FlashMode.off:
        currentFlashMode = FlashMode.auto;

        await controller.setFlashMode(
          FlashMode.auto,
        );
        flashIcon = const Icon(
          Icons.flash_auto,
          size: 30,
        );
        update();
        return;
      case FlashMode.auto:
        currentFlashMode = FlashMode.always;

        await controller.setFlashMode(
          FlashMode.always,
        );
        flashIcon = const Icon(
          Icons.flash_on,
          size: 30,
        );
        update();
        return;
      case FlashMode.always:
        currentFlashMode = FlashMode.torch;
        await controller.setFlashMode(
          FlashMode.torch,
        );
        flashIcon = const Icon(
          Icons.highlight,
          size: 30,
        );
        update();
        return;

      case FlashMode.torch:
        currentFlashMode = FlashMode.off;
        await controller.setFlashMode(
          FlashMode.off,
        );
        flashIcon = const Icon(
          Icons.flash_off,
          size: 30,
        );
        update();
        return;

      default:
        currentFlashMode = FlashMode.off;
        await controller.setFlashMode(
          FlashMode.off,
        );
        flashIcon = const Icon(
          Icons.flash_off,
          size: 30,
        );
        update();
        return;
    }
  }


}
