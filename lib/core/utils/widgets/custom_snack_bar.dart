import 'package:ecommerce/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static final CustomSnackBar _init = CustomSnackBar();

  Widget _buildContent(content) {
    return Container(
      height: Get.height * .1,
      alignment: Alignment.center,
      child: _content(content),
    );
  }

  Widget _content(content) {
    if (content is String) {
      return CustomText(content);
    }
    return content;
  }

  SnackBar _snack(content, [Duration? duration]) {
    return SnackBar(
      elevation: 10,
      behavior: SnackBarBehavior.fixed,
      content: _buildContent(content),
      duration: duration ?? const Duration(hours: 2),
      backgroundColor: Colors.white,
    );
  }

  void _show(content, [duration]) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(_init._snack(content, duration));
  }

  static void show(content, [duration]) => _init._show(content, duration);

  void snackBar(content, [duration]) => _init._show(content, duration);

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: Get.context!,
      // barrierDismissible: false,
      barrierLabel: "Password Change",
      builder: (BuildContext context) {
        return Dialog(
            alignment: Alignment.bottomCenter,
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(0),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          topLeft: Radius.circular(22)),
                      color: colorBackground),
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: const Text("You can make cool stuff!",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center),
                ),
              ],
            ));
      },
    );
  }

  Future<void> showBottomSheet(Widget content) async {
    return showModalBottomSheet<void>(
      context: Get.context!,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: colorBackground,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22),
                  topLeft: Radius.circular(22))
          ),
          child: Stack(
            children: [
              Positioned.fill(
                  top: 20,
                  // width: Get.width * .2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: Get.width * .2,
                      height: 6,
                      decoration: BoxDecoration(
                          color: colorGray,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              width: 6,
                              color: colorGray
                          )
                      ),
                    ),
                  )
              ),
              const VerticalSpace(20),
              content
            ],
          ),
        );
      },
        // isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius:  BorderRadius.only(
              topRight: Radius.circular(22),
              topLeft: Radius.circular(22)),
        )
    );
  }
}
