import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
class CustomText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize, width,letterSpacing,lineHeight;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final GlobalKey? textKey;
  const CustomText(this.data,
      {Key? key,
      this.color,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w100,
      this.textAlign,
      this.width,
      this.onTap,
      this.padding, this.letterSpacing, this.lineHeight, this.textKey})
      : super(key: key);

  TextStyle _buildTextStyle() {
    return GoogleFonts.metrophobic(
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
      textStyle: TextStyle(
          height: lineHeight
      ),
      color:
          color ?? (Get.isDarkMode ? colorDarkPrimaryText : colorPrimaryText),
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  Widget _buildText() {
    return AutoSizeText(
      data,
      key: textKey,
      style: _buildTextStyle(),
      maxLines: 4,
      wrapWords: true,
      overflow: TextOverflow.ellipsis,
      textDirection:
          (CustomWidgets().isRTL ? TextDirection.rtl : TextDirection.ltr),
      textAlign: textAlign ??
          (CustomWidgets().isRTL ? TextAlign.right : TextAlign.left),
    );
  }

  Widget _buildContainer() {
    return Container(
      padding: padding,
      width: width,
      child: _buildText(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _buildContainer(),
    );
  }
}
