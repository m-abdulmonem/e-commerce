
import 'package:ecommerce/futures/categories/presentation/pages/categories_view.dart';
import 'package:ecommerce/futures/profile/presentation/pages/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/presentation/home_view.dart';


class MainController extends GetxController{

  int selectedView = 0;

  List<Widget> views = const  <Widget>[
     HomeView(),
     CategoriesView(),
     HomeView(),
     HomeView(),
     ProfileView(),
  ];

  void onItemTapped(int index) {
    selectedView = index;
    update();
  }

}