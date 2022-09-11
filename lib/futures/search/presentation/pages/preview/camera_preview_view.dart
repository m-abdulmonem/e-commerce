import '/core/utils/custom_widgets.dart';
import '../../manager/camera_controller.dart';
import 'widgets/camera_preview_body.dart';
import 'package:flutter/material.dart';

class CameraPreviewView extends GetWidget<SearchCameraController> {

  const CameraPreviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.path != null) {
      return Scaffold(
        appBar: CustomAppBar(title: "Crop the item",search: false),
        body: CameraPreviewBody(controller.path!),
      );
    } else {
      Get.back();
      return Scaffold(body : Container());
    }
  }
}
