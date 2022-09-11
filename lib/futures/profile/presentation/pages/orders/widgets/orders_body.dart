import 'package:ecommerce/core/utils/custom_widgets.dart';
import 'package:ecommerce/futures/profile/presentation/pages/orders/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({Key? key}) : super(key: key);

  Widget _buildTabs() {
    return TabBar(
      unselectedLabelColor: colorPrimaryText,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: colorPrimaryText,
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      labelColor: Colors.white,
      indicator: BoxDecoration(
        color: colorPrimaryText,
        borderRadius: BorderRadius.circular(50),
      ),
      tabs: const [
        Tab(text: "Delivered"),
        Tab(text: "Processing"),
        Tab(text: "Cancelled"),
      ],
    );
  }

  Widget _buildBody() {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      children: [
        const CustomPageHeader("My Profile"),
        _buildTabs(),
        VerticalSpace(Get.height * .03),
        SizedBox(
          height: Get.height * .7,
          child: TabBarView(children: [
            ListView.builder(
              itemBuilder: (_, index) {
                return OrderCard(
                  orderNumber: "Order №194703$index",
                  date: "05-12-2019",
                  trackingNumber: "IW3475453455",
                  totalAmount: "112\$",
                  quantity: 3,
                  status: "Delivered",
                );
              },
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (_, index) {
                return OrderCard(
                  orderNumber: "Order №194703$index",
                  date: "05-12-2019",
                  trackingNumber: "IW3475453455",
                  totalAmount: "112\$",
                  quantity: 3,
                  status: "Processing",
                );
              },
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (_, index) {
                return OrderCard(
                  orderNumber: "Order №194703$index",
                  date: "05-12-2019",
                  trackingNumber: "IW3475453455",
                  totalAmount: "112\$",
                  quantity: 3,
                  status: "Cancelled",
                );
              },
              itemCount: 10,
            )
          ]),
        )
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
