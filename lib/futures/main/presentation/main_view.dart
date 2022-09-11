import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/core/utils/custom_widgets.dart';
import 'manger/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  List<BottomNavigationBarItem> _items() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: "Home",
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), label: "Shop"),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined), label: "Bag"),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart),
        label: "Favorite",
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person),
        label: "Profile",
      ),
    ];
  }

  Widget _buildBody() {
    return GetBuilder<MainController>(
      builder: (controller) {
        return controller.views.elementAt(controller.selectedView);
      },
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      iconSize: 20,
      unselectedItemColor: colorLight,
      elevation: 0,
      backgroundColor: Colors.white,
      selectedItemColor: colorPrimary,
      showUnselectedLabels: true,
      currentIndex: controller.selectedView,
      onTap: controller.onItemTapped,
      enableFeedback: true,
      items: _items(),
      type: BottomNavigationBarType.fixed,
    );
  }

  Widget _buildBottomNavigationBuilder() {
    return GetBuilder<MainController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.06),
                  blurRadius: 20,
                  spreadRadius: 4),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: _buildBottomNavigation(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBuilder(),
    );
  }
}
