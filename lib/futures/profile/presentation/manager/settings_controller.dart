import '../pages/settings/widgets/update_password.dart';
import '/core/utils/custom_widgets.dart';
import 'package:flutter/cupertino.dart';

class SettingsController extends GetxController with Validator{
  final TextEditingController passController = TextEditingController(),
      repassController = TextEditingController();

  String name = "", dateOfBirth = "",oldPassword= "",newPassword="";

  bool sales = true;
  bool delivery = false;
  bool arrivals = false;


  String? checkPassword(val){
    if (passController.text != repassController.text){
      return "Password not match!";
    }
    return passwordValidate(val);
  }


  void changePassword(){
    CustomWidgets().showBottomSheet(const UpdatePassword());
  }

  void onSalesChanged(bool val){
    sales = val;
    update();
  }
  void onDeliveryChanged(bool val){
    delivery = val;
    update();
  }
  void onArrivalsChanged(bool val){
    arrivals = val;
    update();
  }

  void updatePassword(){
    ///TODO: implement provider here
  }
}