import 'package:get/get.dart';
import '../../domain/models/profile_list_item_model.dart';

class ProfileController extends GetxController{
  final List<ProfileListItemModel> sections = [
    ProfileListItemModel(
      title: "My orders",
      description: "Already have 12 orders",
      route: "orders",
    ),
    ProfileListItemModel(
      title: "Shipping addresses",
      description: "3 addresses",
      route: "address",
    ),
    ProfileListItemModel(
      title: "Payment methods",
      description: "Visa  **34",
      route: "payments",
    ),
    ProfileListItemModel(
      title: "Promocodes",
      description: "You have special promocodes",
      route: "promo/codes",
    ),
    ProfileListItemModel(
      title: "My reviews",
      description: "Reviews for 4 items",
      route: "reviews",
    ),
    ProfileListItemModel(
      title: "Settings",
      description: "Notifications, password",
      route: "settings",
    ),
  ];


}