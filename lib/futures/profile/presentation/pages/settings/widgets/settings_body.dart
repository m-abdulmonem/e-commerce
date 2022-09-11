import '../../../manager/settings_controller.dart';
import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class SettingsBody extends GetWidget<SettingsController> {
  final TextEditingController _date = TextEditingController(text: "12/12/1989"),
      _password = TextEditingController(text: "14465sdsd");
  SettingsBody({Key? key}) : super(key: key);

  Widget _buildBody() {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      children: [
        const CustomPageHeader("Settings"),
        VerticalSpace(Get.height * .03),
        CustomText(
          "Personal Information",
          width: Get.width,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
          letterSpacing: .9,
        ),
        VerticalSpace(Get.height * .02),
        Form(
            child: Column(
          children: [
            CustomInput(
              label: "Full name",
            ),
            VerticalSpace(Get.height * .03),
            CustomInput(
              label: "Date of Birth",
              controller: _date,
            )
          ],
        )),
        VerticalSpace(Get.height * .05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              "Password",
              fontWeight: FontWeight.w700,
              letterSpacing: .9,
            ),
            CustomText(
              "Change",
              color: colorGray,
              onTap: controller.changePassword,
            )
          ],
        ),
        VerticalSpace(Get.height * .02),
        CustomInput(
          label: "Password",
          obscureText: true,
          controller: _password,
        ),
        VerticalSpace(Get.height * .05),
        CustomText(
          "Notifications",
          width: Get.width,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
          letterSpacing: .9,
        ),
        VerticalSpace(Get.height * .02),
        GetBuilder<SettingsController>(builder: (sales) {
          return SwitchListTile(
            title: const CustomText(fontWeight: FontWeight.w600, "Sales"),
            value: sales.sales,
            activeColor: colorSuccess,
            onChanged: sales.onSalesChanged,
          );
        }),
        VerticalSpace(Get.height * .02),
        GetBuilder<SettingsController>(builder: (arrivals) {
          return SwitchListTile(
            title:
                const CustomText(fontWeight: FontWeight.w600, "New arrivals"),
            value: arrivals.arrivals,
            activeColor: colorSuccess,
            onChanged: arrivals.onArrivalsChanged,
          );
        }),
        VerticalSpace(Get.height * .02),
        GetBuilder<SettingsController>(builder: (delivery) {
          return SwitchListTile(
            title: const CustomText(
                fontWeight: FontWeight.w600, "Delivery status changes"),
            value: delivery.delivery,
            activeColor: colorSuccess,
            onChanged: delivery.onDeliveryChanged,
          );
        }),
        VerticalSpace(Get.height * .05),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        padding: CustomWidgets.screenPadding,
        child: _buildBody(),
      ),
    );
  }
}
