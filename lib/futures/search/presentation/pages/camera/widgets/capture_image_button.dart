import '/core/utils/custom_widgets.dart';
import '../../../manager/camera_controller.dart';
import 'package:flutter/material.dart';

class CaptureImageButton extends GetWidget<SearchCameraController> {
  final bool toFrontCamera;
  const CaptureImageButton({this.toFrontCamera = false, Key? key})
      : super(key: key);

  Widget _buildFlashButton() {
    return GetBuilder<SearchCameraController>(builder: (flash) {
      return IconButton(onPressed: flash.flashAction, icon: flash.flashIcon);
    });
  }

  Widget _buildRotateCameraButton() {
    return IconButton(
        onPressed: () => Get.offNamed(
            toFrontCamera ? "search/camera/front" : "search/camera"),
        icon: Icon(
          Icons.rotate_right,
          color: !toFrontCamera ? colorPrimary : Colors.black,
          size: 30,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildFlashButton(),
        CustomButton(
          width: 60,
          height: 60,
          borderRadius: BorderRadius.circular(50),
          onTap: controller.takePicture,
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
        ),
        _buildRotateCameraButton()
      ],
    );
  }
}
