
import 'package:ecommerce/futures/categories/presentation/manager/categories_controller.dart';
import 'package:get/get.dart';

import '../../../../futures/main/presentation/manger/main_controller.dart';
import '../../../../futures/profile/presentation/manager/profile_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => CategoriesController());

  }

}