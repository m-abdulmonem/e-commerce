import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/repository/i_auth_repository.dart';
import '/core/utils/util/validator.dart';

class AuthController extends GetxController with Validator {
  GlobalKey<FormState> authForm = GlobalKey<FormState>();
  final IAuthRepository authRepository;
  String password = "", email = "", name = "";
  bool isPassHide = true;
  AuthController({required this.authRepository});


  get form => authForm.currentState;

  void signIn() async {
    if (form!.validate()) {
      form.save();
      await authRepository.singIn(phone: email, password: password);
    }
  }

  void signUp() async {
    if (form!.validate()) {
      form.save();
      await authRepository.singUp(
        password: password,
        phone: email,
      );

      Get.offAllNamed("main");
    }
  }

  void forgetPassword() async {
    if (form!.validate()) {
      form.save();
      Get.toNamed("auth/verification");
      // await authRepository.forgetPassword(auth: phone);
    }
  }


  void signInWithFacebook() async => await authRepository.loginWithFacebook();

  void signInWithGoogle() async => await authRepository.loginWithGoogle();


  void signOut() async => await authRepository.signOut();


  void showPass(){
    isPassHide = !isPassHide;
    if (kDebugMode) {
      print(isPassHide);
    }
    update();
  }

}
