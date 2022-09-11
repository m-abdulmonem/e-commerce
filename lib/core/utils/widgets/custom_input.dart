import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hint, label;
  final Color? color, hintColor, labelColor, prefixIconColor;
  final bool? obscureText, autofocus;
  final TextStyle? labelStyle, hintStyle, style;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final void Function(String?)? onSave, onChange;
  final String? Function(String?)? validator;
  final Widget? prefixIcon, suffixIcon;
  final double? radius;

  final OutlineInputBorder _inputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(4)));

  final OutlineInputBorder _errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(
      color: colorError,
      width: 2.0,
    ),
  );

  CustomInput(
      {Key? key,
      this.hint,
      this.label,
      this.color,
      this.hintColor,
      this.labelColor = colorGray,
      this.prefixIconColor,
      this.obscureText,
      this.autofocus,
      this.labelStyle,
      this.hintStyle,
      this.style,
      this.controller,
      this.textInputAction,
      this.inputType,
      this.onSave,
      this.validator,
      this.prefixIcon,
      this.radius,
      this.onChange,
      this.suffixIcon})
      : super(key: key);

  BoxDecoration get _boxDecoration {
    return  BoxDecoration(
        color: CustomWidgets().isDarkMode ? colorDarkSecondary : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 8,
              spreadRadius: 1),
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 8,
              spreadRadius: 1)
        ]);
  }

  Widget _buildLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      // padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: CustomText(label ?? "", fontSize: 18, color: CustomWidgets().isDarkMode ? const Color(0xffABB4BD) :colorGray),
    );
  }

  InputDecoration  _buildInputDecoration() {
    return InputDecoration(
        border: _inputBorder,
        focusColor: colorPrimaryText,
        enabledBorder: _inputBorder,
        focusedBorder: _inputBorder,
        errorBorder: _errorInputBorder,
        suffixIcon: suffixIcon,
        suffixIconColor: colorSuccess,
        errorStyle: const TextStyle(color: colorError, fontSize: 15),
        alignLabelWithHint: true,
        contentPadding:
            const EdgeInsets.only(right: 15, left: 15, top: 30, bottom: 27),
        label: _buildLabel(),
        filled: CustomWidgets().isDarkMode,
        fillColor: CustomWidgets().isDarkMode ? colorDarkSecondary : Colors.white,

        hintText: hint,
        hintStyle: hintStyle ?? TextStyle(color: hintColor));
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.none,
      keyboardType: inputType ?? TextInputType.text,
      style: style ?? TextStyle(color: CustomWidgets().isDarkMode ? colorDarkOrdinaryText :colorPrimaryText),
      obscureText: obscureText ?? false,
      onSaved: onSave,
      onChanged: onChange,
      validator: validator,
      autofocus: autofocus ?? false,
      decoration: _buildInputDecoration(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      child: _buildTextFormField(),
    );
  }
}
