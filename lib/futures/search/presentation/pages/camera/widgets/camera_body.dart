import '/core/utils/custom_widgets.dart';
import '../../../manager/camera_controller.dart';
import 'camera_preview_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../main.dart';

class CameraBody extends StatefulWidget {
  const CameraBody({Key? key}) : super(key: key);

  @override
  State<CameraBody> createState() => _CameraBodyState();
}

class _CameraBodyState extends State<CameraBody> {
  final controller = Get.find<SearchCameraController>();


  @override
  void initState() {
    super.initState();

    controller.initCamera(cameras.first);
  }


  @override
  Widget build(BuildContext context) {
    return const CameraPreviewWidget();
  }
}
