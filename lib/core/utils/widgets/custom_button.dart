import 'package:flutter/material.dart';
import '../custom_widgets.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final double? width, height, fontSize;
  final VoidCallback? onTap, onLongTap;
  final bool isOutLine;
  final Color textColor, backgroundColor;
  final BorderRadius? borderRadius;
  const CustomButton({
    Key? key,
    this.text,
    this.onTap,
    this.onLongTap,
    this.width,
    this.height = 50,
    this.fontSize = 16,
    this.isOutLine = false,
    this.borderRadius,
    this.textColor = Colors.white,
    this.backgroundColor = colorPrimary,
    this.child,
  }) : super(key: key);

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        color: !isOutLine ? backgroundColor : null,
        border: Border.all(color: backgroundColor),
        borderRadius: borderRadius ?? BorderRadius.circular(50));
  }

  Widget _buildText() {
    return child != null
        ? child!
        : CustomText(
            text!.toCapitalize,
            fontSize: fontSize,
            width: width ?? Get.width,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            color: textColor,
          );
  }

  Widget _buildContainer() {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: _buildBoxDecoration(),
      child: _buildText(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongTap,
      child: _buildContainer(),
    );
  }
}

