import 'package:flutter/material.dart';
import '/core/utils/custom_widgets.dart';
import '../manager/home_controller.dart';

class HomeBody extends GetWidget<HomeController> {
  const HomeBody({Key? key}) : super(key: key);


  Widget _buildBody(){
    return Column(
      children:  [
        const VerticalSpace(10),
        CustomButton(
          text: "Click me",
          onTap: () {
            Get.toNamed("search");
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: Get.height * .05,
        left: 14,
        right: 14
      ),
      child: _buildBody(),
    );
  }
}

