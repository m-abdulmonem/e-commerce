import 'package:flutter/material.dart';
import '/core/utils/custom_widgets.dart';
import 'manager/home_controller.dart';
import 'widgets/home_body.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
