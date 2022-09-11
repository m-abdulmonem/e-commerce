import 'package:ecommerce/futures/profile/presentation/manager/settings_controller.dart';

import '/futures/profile/presentation/manager/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SettingsController());
  }
}
