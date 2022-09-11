import '../../../widgets/additional_auth_methods.dart';
import '/core/utils/custom_widgets.dart';
import '../../../manger/auth_controller.dart';
import 'package:flutter/material.dart';

class RegisterBody extends GetWidget<AuthController> {
  const RegisterBody({Key? key}) : super(key: key);

  Widget _buildSignInText() {
    return GestureDetector(
      onTap: () => Get.toNamed("auth"),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            "Already have an account?",
            onTap: () {
              Get.delete<AuthController>();
              Get.toNamed("auth");
            },
            textAlign: TextAlign.right,
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
          const Flexible(
              child: Icon(
                Icons.arrow_forward,
                color: colorPrimary,
              ))
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.authForm,
      child: Column(
        children: [
          CustomText("Sign up",fontSize: 35,textAlign: TextAlign.start,width: Get.width,fontWeight: FontWeight.w900,),
          VerticalSpace(Get.height * .05),
          CustomInput(
            label: "Name".tr,
            onSave: (val) => controller.name = val!,
            validator: controller.requiredInput,
          ),
          VerticalSpace(Get.height * .02),
          CustomInput(
            label: "Email".tr,
            onSave: (val) => controller.email = val!,
            validator: controller.requiredInput,
          ),
          VerticalSpace(Get.height * .02),
          CustomInput(
            obscureText: controller.isPassHide,
            label: "password",
            onSave: (val) => controller.password = val!,
            validator: controller.requiredInput,
          ),
          VerticalSpace(Get.height * .02),

          _buildSignInText(),
          VerticalSpace(Get.height * .09),
          CustomButton(
            text: "Sign up".tr,
            onTap: controller.signIn,
          ),
          const AdditionalAuthMethods(
            isRegisterPage: true,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 14, left: 14, top: Get.height * .08),
      child: _buildForm(),
    );
  }
}
