import 'package:ecommerce/core/utils/custom_widgets.dart';
import '../../../manager/search_result_controller.dart';
import 'package:flutter/material.dart';

class SearchResultBody extends GetWidget<SearchResultController> {
  const SearchResultBody({Key? key}) : super(key: key);

  Widget _buildBody() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:   [
          const Icon(
            Icons.search,
            color: colorPrimary,
            size: 100,
          ),
          VerticalSpace(Get.height*.05),
          const CustomText(
            "Finding similar results....",
            fontWeight: FontWeight.w900,
            fontSize: 40,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: _buildBody(),
    );
  }
}
