import 'package:flutter/cupertino.dart';

const Color colorPrimary = Color(0xffDB3022);

const Color colorPrimaryText = Color(0xff222222);
const Color colorBackground = Color(0xffF9F9F9);
const Color colorLight = Color(0xffDADADA);
const Color colorGray = Color(0xff9B9B9B);
const Color colorError = Color(0xffF01F0E);
const Color colorSuccess = Color(0xff2AA952);

final Color colorDarkPrimary =  MyColor("1E1F28");
final Color colorDarkSecondary =  MyColor("2A2C36");
final Color colorDarkRed =  MyColor("EF3651");
final Color colorDarkPrimaryText =  MyColor("F7F7F7");
final Color colorDarkOrdinaryText =  MyColor("F5F5F5");




class MyColor extends Color{

  final String color;

  MyColor(this.color) : super(int.parse("0xff${color.replaceAll("#", "")}"));

}