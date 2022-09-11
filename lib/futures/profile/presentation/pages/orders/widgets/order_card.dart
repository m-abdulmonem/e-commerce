import 'package:ecommerce/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String orderNumber, date, trackingNumber, totalAmount, status;
  final int quantity;
  const OrderCard(
      {Key? key,
      required this.orderNumber,
      required this.date,
      required this.trackingNumber,
      required this.totalAmount,
      required this.quantity,
      required this.status})
      : super(key: key);
  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.12),
            blurRadius: 12,
          blurStyle: BlurStyle.outer,
          spreadRadius: 1
        )
      ]
    );
  }

  Widget _buildContentHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          orderNumber,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        CustomText(
          date,
          color: colorGray,
        )
      ],
    );
  }

  Widget _buildTrackingNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomText(
          "Tracking number:",
          color: colorGray,
        ),
        const HorizontalSpace(12),
        CustomText(
          trackingNumber,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        )
      ],
    );
  }

  Widget _buildInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CustomText(
              "Quantity:",
              color: colorGray,
            ),
            const HorizontalSpace(12),
            CustomText(
              quantity.toString(),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
        Row(
          children: [
            const CustomText(
              "Total Amount:",
              color: colorGray,
            ),
            const HorizontalSpace(12),
            CustomText(
              totalAmount,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
          ],
        )
      ],
    );
  }

  Color get _buildStatusColor {
    if (status == "Delivered") {
      return colorSuccess;
    } else if (status == "Cancelled") {
      return colorError;
    }
    return colorPrimaryText;
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          text: "Details",
          textColor: colorPrimaryText,
          backgroundColor: colorPrimaryText,
          height: 40,
          isOutLine: true,
          width: Get.width * .3,
          onTap: () => Get.toNamed("main/profile/order/details"),
        ),
        CustomText(
          status,
          color: _buildStatusColor,
        )
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildContentHeader(),
        VerticalSpace(Get.height * .03),
        _buildTrackingNumber(),
        VerticalSpace(Get.height * .015),
        _buildInfo(),
        VerticalSpace(Get.height * .015),
        _buildFooter(),
        VerticalSpace(Get.height * .015),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(12),
      decoration: _buildDecoration(),
      child: _buildContent(),
    );
  }
}
