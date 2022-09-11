import '../../manager/categories_controller.dart';
import 'package:flutter/material.dart';

import '/core/utils/custom_widgets.dart';

class CategoriesBody extends GetWidget<CategoriesController> {
  const CategoriesBody({Key? key}) : super(key: key);

  Widget _buildTabs() {
    return TabBar(
      unselectedLabelColor: colorPrimaryText,
      unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: colorPrimary,
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      labelColor: colorPrimaryText,
      labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
      tabs: const [
        Tab(text: "Women"),
        Tab(text: "Men"),
        Tab(text: "Kids"),
      ],
    );
  }

  Widget _buildBanner() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorPrimary,
        ),
        child: Center(
          child: Column(
            children: const [
              CustomText(
                "SUMMER SALES",
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              VerticalSpace(10),
              CustomText(
                "Up to 50% off",
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return FutureBuilder<List>(
        future: controller
            .categories, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Container();
          }
          return Container();
        });
  }

  Widget _buildBody() {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildTabs(),
        VerticalSpace(Get.height * .03),
        _buildBanner(),
        _buildCategories()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        padding: CustomWidgets.screenPadding,
        child: _buildBody(),
      ),
    );
  }
}
