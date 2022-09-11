import '/core/utils/custom_widgets.dart';
import 'widgets/categories_body.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Categories",
        elevation: 10,
      ),
      body: const CategoriesBody(),
    );
  }
}
