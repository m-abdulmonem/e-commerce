export 'widgets/custom_input.dart';
export 'widgets/custom_text.dart';
export 'widgets/custom_spacing.dart';
export 'widgets/custom_button.dart';
export 'util/constants/constant.dart';
export 'util/binding/binding.dart';
export '../config/themes/themes.dart';
export 'widgets/custom_body.dart';
export 'widgets/custom_app_bar.dart';
export 'extensions/custom_list_extensions.dart';
export 'extensions/custom_string_extensions.dart';
export 'util/validator.dart';
export 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import '../config/locale/locale_service.dart';
import '../config/routes/app_pages.dart';
import '../config/themes/theme_services.dart';
import '../config/themes/themes.dart';

class CustomWidgets extends LocaleServices
    with ThemeService, AppPages, CustomSnackBar {
  static final GetStorage storage = GetStorage();

  static ThemeData get darkTheme => Themes.dark;
  static ThemeData get lightTheme => Themes.light;

  static EdgeInsetsGeometry get screenPadding =>
      const EdgeInsets.only(top: 14, left: 14, right: 15);

  static bool get isLoggedIn =>
      storage.hasData("IS_LOGGED_KEY") && storage.read("IS_LOGGED_KEY");

  static bool get isOnBoarding =>
      storage.hasData("ON_BOARDING_FINISHED_KEY") &&
      storage.read("ON_BOARDING_FINISHED_KEY");
}
