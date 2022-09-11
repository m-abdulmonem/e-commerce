import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String imgName;
  final VoidCallback onTap;
  const SocialButton({Key? key, required this.imgName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 8,
                spreadRadius: 1
              )
            ],
            borderRadius:  BorderRadius.all(Radius.circular(15)),
             ),
        child: SvgPicture.asset("assets/images/$imgName.svg", width: 35),
      ),
    );
  }
}
