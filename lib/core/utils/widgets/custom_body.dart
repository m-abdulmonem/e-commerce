import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBody extends StatelessWidget {
  final List<Widget> children;

  const CustomBody({required this.children, Key? key}) : super(key: key);

  EdgeInsets get _padding => EdgeInsets.symmetric(
      horizontal: Get.width * .03, vertical: Get.height * .01);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        children: children,
      ),
    );
  }
}

class SingleCustomBody extends StatelessWidget {
  final Widget? child;

  const SingleCustomBody({this.child, Key? key}) : super(key: key);

  EdgeInsets get _padding => EdgeInsets.symmetric(
      horizontal: Get.width * .03, vertical: Get.height * .01);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: child,
    );
  }
}