import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'core/utils/custom_widgets.dart';

List<CameraDescription> cameras = [];
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  try {
    cameras = await availableCameras();

  } on CameraException catch (e) {
    if (kDebugMode) {
      print(e.description);
    }
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      theme:  Themes.light,
      initialBinding: Binding(),
      initialRoute: CustomWidgets().initial,
      getPages: CustomWidgets().routes,
      darkTheme: CustomWidgets.darkTheme,
      themeMode: CustomWidgets().theme,
      translations: CustomWidgets().translations,
      locale: Locale(CustomWidgets().locale),
      fallbackLocale: Get.deviceLocale,
    );
  }
}
