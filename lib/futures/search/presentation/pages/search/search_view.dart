import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'widgets/search_body.dart';
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Visual search",search: false,) ,
      body: const SearchBody(),
    );
  }
}
