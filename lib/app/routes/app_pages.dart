import 'package:get/get.dart';
import 'package:halalin/app/modules/home/views/tabs/ocr/bindings/ocr_binding.dart';
import 'package:halalin/app/modules/home/views/tabs/ocr/views/ocr_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/view/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashScreenView(),
        binding: SplashScreenBinding()),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OCR,
      page: () => const OcrView(),
      binding: OcrBinding(),
    ),
  ];
}
