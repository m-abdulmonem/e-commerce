import '/core/utils/custom_widgets.dart';
import '../../../manager/camera_controller.dart';
import 'camera_preview_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../main.dart';

class FrontCameraBody extends StatefulWidget {
  const FrontCameraBody({Key? key}) : super(key: key);

  @override
  State<FrontCameraBody> createState() => _CameraBodyState();
}

class _CameraBodyState extends State<FrontCameraBody> {
  final controller = Get.put(SearchCameraController());

  @override
  void initState() {
    super.initState();

    controller.initCamera(cameras.last);
  }


  @override
  Widget build(BuildContext context) {
    return const CameraPreviewWidget();
  }
}
