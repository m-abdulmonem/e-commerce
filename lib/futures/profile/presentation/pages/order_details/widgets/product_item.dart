import 'package:ecommerce/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12)
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.12),
              blurRadius: 12,
              blurStyle: BlurStyle.outer,
              spreadRadius: 1)
        ]);
  }

  Widget _buildContent() {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.vertical,
      children: [
        const CustomText(
          "Pullover",
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        const VerticalSpace(3),
        const CustomText(
          "Mango",
          color: colorGray,
        ),
        const VerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: const [
                CustomText(
                  "Color:",
                  color: colorGray,
                ),
                HorizontalSpace(3),
                CustomText("Grey")
              ],
            ),
            HorizontalSpace(Get.width * .1),
            Row(
              children: const [
                CustomText(
                  "Size:",
                  color: colorGray,
                ),
                HorizontalSpace(3),
                CustomText("L")
              ],
            )
          ],
        ),
        const VerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                CustomText(
                  "Units:",
                  color: colorGray,
                ),
                HorizontalSpace(3),
                CustomText("1")
              ],
            ),
            Row(
              children: const [
                CustomText(
                  "51\$",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        bottomLeft: Radius.circular(15),
      ),
      child: Image.asset(
        "assets/images/splash_img.jpg",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildCard() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(child: _buildImage()),
        Flexible(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.7,horizontal: 9),
            decoration: _buildDecoration(),
            child: _buildContent(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCard();
  }
}
