
import '/futures/search/presentation/manager/search_result_controller.dart';
import 'package:get/get.dart';

import '/futures/search/presentation/manager/camera_controller.dart';


class SearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchCameraController());
    Get.lazyPut(() => SearchResultController());

  }

}