import '../../../manager/camera_controller.dart';
import 'package:image_picker/image_picker.dart';

import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class SearchBody extends GetWidget<SearchCameraController> {
  const SearchBody({Key? key}) : super(key: key);

  Widget _buildBodyContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            "Search for an outfit by taking a photo or uploading an image",
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
          VerticalSpace(Get.height  * .03),
          CustomButton(
            text: "TAKE A PHOTO",
            onTap: () => Get.toNamed("search/camera"),
          ),
          VerticalSpace(Get.height  * .03),
          CustomButton(
            text: "UPLOAD AN IMAGE",
            isOutLine: true,
            textColor: Colors.white,
            backgroundColor: Colors.white,
            onTap: () async{
              final ImagePicker picker = ImagePicker();
              // Pick an image
              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
              controller.path = image?.path;
              if (controller.path != null){
                Get.toNamed("search/camera/preview");
              }
            },
          ),
          VerticalSpace(Get.height  * .2),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      // height: Get.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash_img.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.srgbToLinearGamma())),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SizedBox(
          height: Get.height,
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBackgroundImage();
  }
}
