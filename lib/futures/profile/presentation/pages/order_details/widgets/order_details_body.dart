import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'product_item.dart';

class OrderDetailsBody extends StatefulWidget {
  const OrderDetailsBody({Key? key}) : super(key: key);

  @override
  State<OrderDetailsBody> createState() => _OrderDetailsBodyState();
}

class _OrderDetailsBodyState extends State<OrderDetailsBody> {
  final GlobalKey _key = GlobalKey();
  double? width;



  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomText(
              "Order №1947034",
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            CustomText(
              "05-12-2019",
              color: colorGray,
            )
          ],
        ),
        const VerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                CustomText(
                  "Tracking number:",
                  color: colorGray,
                ),
                HorizontalSpace(5),
                CustomText(
                  "IW3475453455",
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const CustomText(
              "Delivered",
              color: colorSuccess,
            )
          ],
        )
      ],
    );
  }

  Widget _buildInformation() {
    return Column(
      children: [
        const VerticalSpace(12),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                key: _key,
                flex: 1,
                child: const CustomText(
                  "Shipping Address:",
                  color: colorGray,
                )),
            const HorizontalSpace(15),
            const Flexible(
              flex: 2,
              child: CustomText(
                "3 Bridge Court ,Chino Hills, CA 91709, United States",
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        const VerticalSpace(12),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: CustomText(
                "Payment method:",
                color: colorGray,
                width: width,
              ),
            ),
            const HorizontalSpace(15),
            Flexible(
              flex: 2,
              child: Row(
                children: const [
                  Icon(Icons.credit_card_rounded),
                  CustomText(
                    "**** **** **** 3947",
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
            )
          ],
        ),
        const VerticalSpace(12),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: CustomText(
                "Delivery method:",
                color: colorGray,
                width: width,
              ),
            ),
            const HorizontalSpace(15),
            const Flexible(
              flex: 2,
              child: CustomText(
                "FedEx, 3 days, 15\$",
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        const VerticalSpace(12),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 2,
              child: CustomText(
                "Discount:",
                color: colorGray,
                width: width,
              ),
            ),
            const HorizontalSpace(15),
            const Flexible(
              flex: 2,
              child: CustomText(
                "10%, Personal promo code",
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        const VerticalSpace(12),
        Flex(
          direction: Axis.horizontal,
          children: [
            CustomText(
              "Total Amount:",
              color: colorGray,
              width: width,
            ),
            const HorizontalSpace(15),
            const Flexible(
              flex: 2,
              child: CustomText(
                "133\$",
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        VerticalSpace(Get.height * .04),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: CustomButton(
                text: "Reorder",
                textColor: colorPrimaryText,
                backgroundColor: colorPrimaryText,
                isOutLine: true,
                height: 40,
                onTap: () => "",
              ),
            ),
            HorizontalSpace(Get.width * .1),
            Flexible(
              child: CustomButton(
                text: "Leave feedback",
                onTap: () => "",
                height: 40,
              ),
            )
          ],
        ),
        VerticalSpace(Get.height * .03),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildHeader(),
        VerticalSpace(Get.height * .04),
        CustomText(
          "3 items",
          width: Get.width,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
          letterSpacing: .9,
        ),
        VerticalSpace(Get.height * .04),
        const ProductItem(),
        VerticalSpace(Get.height * .04),
        const ProductItem(),
        VerticalSpace(Get.height * .04),
        const ProductItem(),
        VerticalSpace(Get.height * .04),
        CustomText(
          "Order information",
          width: Get.width,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
          letterSpacing: .9,
        ),
        _buildInformation()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: CustomWidgets.screenPadding,
      child: _buildBody(),
    );
  }
}
