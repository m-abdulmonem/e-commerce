import 'widgets/capture_image_button.dart';
import '../../manager/camera_controller.dart';
import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'widgets/front_camera_body.dart';

class FrontCameraView extends StatefulWidget {
  const FrontCameraView({Key? key}) : super(key: key);

  @override
  State<FrontCameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<FrontCameraView> {
  final controller = Get.find<SearchCameraController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Search by taking a photo",search: false),
      body: const FrontCameraBody(),
      floatingActionButton: const CaptureImageButton(),
    );
  }
}
