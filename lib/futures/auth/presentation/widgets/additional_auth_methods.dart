import 'package:flutter/material.dart';
import '../manger/auth_controller.dart';
import 'social_button.dart';
import '/core/utils/custom_widgets.dart';

class AdditionalAuthMethods extends GetWidget<AuthController> {
  final bool isRegisterPage;
  const AdditionalAuthMethods({Key? key, this.isRegisterPage = false})
      : super(key: key);

  Widget _buildSocialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(imgName: "google", onTap: () => ""),
        const HorizontalSpace(15),
        SocialButton(imgName: "facebook", onTap: () => ""),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(Get.height * .05),
        CustomText(
          "Or ${!isRegisterPage ? "Sign up" : "login"} with social account",
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),

        VerticalSpace(Get.height * .03),
        _buildSocialMediaButtons()
      ],
    );
  }
}
