import '../../../widgets/additional_auth_methods.dart';
import '/core/utils/custom_widgets.dart';
import '../../../manger/auth_controller.dart';
import 'package:flutter/material.dart';

class LoginBody extends GetWidget<AuthController> {
  const LoginBody({Key? key}) : super(key: key);

  Widget _buildForgetPasswordText() {
    return GestureDetector(
      onTap: () => Get.toNamed("auth/password/forget"),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            "Forgot your password?",
            onTap: () => Get.offNamed("auth/password/forget"),
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
          CustomText("Login",fontSize: 35,textAlign: TextAlign.start,width: Get.width,fontWeight: FontWeight.w900,),
          VerticalSpace(Get.height * .05),
          CustomInput(
            label: "Email",
            onSave: (val) => controller.email = val!,
            validator: controller.requiredInput,
          ),
          VerticalSpace(Get.height * .02),
          CustomInput(
            obscureText: true,
            label: "password",
            onSave: (val) => controller.password = val!,
            validator: controller.requiredInput,
          ),
          VerticalSpace(Get.height * .03),
          _buildForgetPasswordText(),
          VerticalSpace(Get.height * .03),
          CustomButton(
            text: "Sign In",
            onTap: controller.signIn,
          ),
          VerticalSpace(Get.height * .1),
          const AdditionalAuthMethods(),
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
