import 'package:flutter/material.dart';

import '../custom_widgets.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final bool search;
  final double? elevation;
  final Color? backgroundColor;
  CustomAppBar(
      {Key? key,
      this.title,
      this.search = true,
      this.elevation = 0,
      this.backgroundColor})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  List<Widget>? _buildActions() {
    if (search) {
      return [
        Padding(
          padding: CustomWidgets().isRTL
              ? const EdgeInsets.only(left: 14)
              : const EdgeInsets.only(right: 14),
          child: IconButton(
              onPressed: () => Get.toNamed("search"),
              icon: const Icon(Icons.search)),
        )
      ];
    }
    return null;
  }

  Widget? _buildTitle() {
    if (title != null) {
      return CustomText(
        title!,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: .9,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: _buildActions(),
      title: _buildTitle(),
      elevation: elevation,
      backgroundColor: backgroundColor,
    );
  }
}

class CustomPageHeader extends StatelessWidget {
  final String title;
  const CustomPageHeader(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * .04),
      child: CustomText(
        title,
        fontSize: 25,
        fontWeight: FontWeight.w900,
        letterSpacing: 1,
        width: Get.width,
      ),
    );
  }
}
