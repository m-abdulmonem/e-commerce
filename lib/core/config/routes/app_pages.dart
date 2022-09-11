import 'package:ecommerce/core/utils/custom_widgets.dart';
import 'package:ecommerce/core/utils/util/binding/profile_biniding.dart';
import 'package:ecommerce/core/utils/util/binding/profile_biniding.dart';
import 'package:ecommerce/core/utils/util/binding/profile_biniding.dart';
import 'package:ecommerce/futures/profile/presentation/pages/order_details/order_details_view.dart';
import 'package:ecommerce/futures/profile/presentation/pages/orders/orders_view.dart';
import 'package:ecommerce/futures/profile/presentation/pages/settings/settings_view.dart';
import 'package:ecommerce/futures/search/presentation/pages/result/search_result_view.dart';
import 'package:ecommerce/futures/search/presentation/pages/search/search_view.dart';
import '../../../futures/auth/presentation/pages/forget_password/forget_password_view.dart';
import '../../../futures/auth/presentation/pages/login/login_view.dart';
import '../../../futures/auth/presentation/pages/register/register_view.dart';
import '../../../futures/main/presentation/main_view.dart';
import '../../../futures/search/presentation/pages/camera/camera_view.dart';
import '../../../futures/search/presentation/pages/camera/front_camera_view.dart';
import '../../../futures/search/presentation/pages/preview/camera_preview_view.dart';
import '../../utils/util/binding/auth_binding.dart';
import '/futures/splash/presentation/splash/splash_view.dart';
import 'app_routes.dart';

mixin AppPages {
  final String initial = Routes.splash;

  final routes = <GetPage<dynamic>>[
    GetPage(name: Routes.splash, page: () => const SplashView()),
    // // GetPage(name: Routes.ON_BOARDING, page: () => const BoardingView()),
    GetPage(
      name: Routes.auth,
      page: () => const LoginView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: Routes.register,
          page: () => const RegisterView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: Routes.forgetPassword,
          page: () => const ForgetPasswordView(),
          binding: AuthBinding(),
        ),
      ],
    ),
    //
    GetPage(
      name: Routes.main,
      page: () => const MainView(),
      binding: HomeBinding(),
      children:  [
        GetPage(
          name: Routes.profileOrder,
          page: () => const OrdersView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: Routes.profileOrderDetails,
          page: () => const OrderDetailsView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: Routes.profileSettings,
          page: () => const SettingsView(),
          binding: ProfileBinding(),
        ),
      ],
    ),
    GetPage(
      name: Routes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
      children: [
        GetPage(
          name: Routes.searchCamera,
          page: () => const CameraView(),
          binding: SearchBinding(),
        ),
        GetPage(
          name: Routes.searchResult,
          page: () => const SearchResultView(),
          binding: SearchBinding(),
        ),
        GetPage(
          name: Routes.searchCameraFront,
          page: () => const FrontCameraView(),
          binding: SearchBinding(),
        ),
        GetPage(
            name: Routes.searchCameraPreview,
            page: () => const CameraPreviewView()),
      ],
    ),




  ];
}
