import 'package:flutter/material.dart';
import '/core/utils/custom_widgets.dart';
import '../../../manger/auth_controller.dart';

class ForgetPasswordBody extends GetWidget<AuthController> {
  const ForgetPasswordBody({Key? key}) : super(key: key);

  Widget _buildInput() {
    return CustomInput(
      label: "Email".tr,
      onSave: (val) => controller.email = val!,
      validator: controller.emailValidate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 14, left: 14, top: Get.height * .08),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.authForm,
        child: Column(
          children: [
            CustomText("Forgot password",fontSize: 25,textAlign: TextAlign.start,width: Get.width,fontWeight: FontWeight.w500,),
            VerticalSpace(Get.height * .1),
            const CustomText(
                "Please, enter your email address. You will receive a link to create a new password via email."),
            VerticalSpace(Get.height * .1),
            _buildInput(),
            VerticalSpace(Get.height * .1),
            CustomButton(
              text: "Send".tr,
              onTap: controller.forgetPassword,
            )
          ],
        ),
      ),
    );
  }
}
