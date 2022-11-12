import 'package:get/get.dart';
import 'package:halalin/app/modules/main/views/tabs/ocr/views/text_recognizer_view.dart';

import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/main/views/tabs/about/bindings/about_binding.dart';
import '../modules/main/views/tabs/about/views/about_view.dart';
import '../modules/main/views/tabs/home/bindings/home_binding.dart';
import '../modules/main/views/tabs/home/views/home_view.dart';
import '../modules/main/views/tabs/ocr/bindings/ocr_binding.dart';
import '../modules/main/views/tabs/ocr/views/ocr_view.dart';
import '../modules/result/bindings/result_binding.dart';
import '../modules/result/views/result_view.dart';
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
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => const ResultView(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: _Paths.OCR,
      page: () => TextRecognizerView(),
      binding: OcrBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
  ];
}
