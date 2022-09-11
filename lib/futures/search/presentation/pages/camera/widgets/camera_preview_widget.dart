import 'package:camera/camera.dart';
import 'package:ecommerce/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

import '../../../manager/camera_controller.dart';


class CameraPreviewWidget extends StatefulWidget {
  const CameraPreviewWidget({Key? key}) : super(key: key);

  @override
  State<CameraPreviewWidget> createState() => _CameraPreviewWidgetState();
}

class _CameraPreviewWidgetState extends State<CameraPreviewWidget> {

  final controller = Get.find<SearchCameraController>();



  @override
  void didChangeDependencies() {
    final CameraController cameraController = controller.controller;

    if (!cameraController.value.isInitialized) {
      return;
    }else{
      controller.initCamera(cameraController.description);
    }

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return AspectRatio(
            aspectRatio: 2/3.2,
            child: CameraPreview(controller.controller),
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator(color: colorPrimary,));
        }
      },
    );
  }
}
