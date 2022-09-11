import '/core/utils/custom_widgets.dart';
import 'widgets/order_details_body.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order Details",
        elevation: 5,
      ),
      body: const OrderDetailsBody(),
    );
  }
}
