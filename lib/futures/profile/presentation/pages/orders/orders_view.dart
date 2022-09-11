import '/core/utils/custom_widgets.dart';
import 'widgets/orders_body.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: CustomAppBar(backgroundColor: Colors.transparent),
      body: const OrdersBody(),
    );
  }
}
