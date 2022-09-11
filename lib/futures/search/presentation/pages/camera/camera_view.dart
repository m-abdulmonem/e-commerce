import 'widgets/capture_image_button.dart';
import '../../manager/camera_controller.dart';
import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'widgets/camera_body.dart';

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final controller = Get.find<SearchCameraController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Search by taking a photo",search: false),
      body: const CameraBody(),
      floatingActionButton: const CaptureImageButton(toFrontCamera: true),
    );
  }
}
