import '/core/utils/custom_widgets.dart';
import '../../../manager/settings_controller.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends GetWidget<SettingsController> {
  const UpdatePassword({Key? key}) : super(key: key);

  Widget _buildForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomInput(
            label: "Old Password",
            validator: controller.passwordValidate,
            onSave: (val) => controller.oldPassword = val!,
          ),
          const VerticalSpace(15),

          CustomText(
            "Forgot Password?",
            width: Get.width,
            textAlign: TextAlign.end,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onTap: () => Get.toNamed("auth/password/forget"),
          ),
          const VerticalSpace(15),
          CustomInput(
            label: "New Password",
            controller: controller.passController,
            validator: controller.checkPassword,
            onSave: (val) => controller.newPassword = val!,
          ),
          const VerticalSpace(15),
          CustomInput(
            label: "Repeat New Password",
            controller: controller.repassController,
            validator: controller.checkPassword
          ),

          const VerticalSpace(15),

          CustomButton(
            text: "SAVE PASSWORD",
            onTap: controller.updatePassword,
          ),
          const VerticalSpace(15),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomWidgets.screenPadding,
      child: Column(
        children: [
          VerticalSpace(Get.height * .05),
          const Center(
            child: CustomText(
              "Password Change",
              fontWeight: FontWeight.w700,
              fontSize: 20,
              textAlign: TextAlign.end,
            ),
          ),
          VerticalSpace(Get.height * .02),
          Expanded(
            child: SingleChildScrollView(
              child: _buildForm(),
            ),
          ),
        ],
      ),
    );
  }
}
