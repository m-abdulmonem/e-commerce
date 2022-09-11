import '/futures/splash/presentation/splash/manager/splash_controller.dart';
import '/futures/home/presentation/manager/home_controller.dart';

import 'package:get/get.dart';

export 'search_binding.dart';
export 'home_binding.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => HomeController());

  }

}