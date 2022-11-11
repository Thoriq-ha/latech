import 'package:get/get.dart';
import 'package:halalin/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:halalin/app/modules/splashscreen/view/splashscreen_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH, 
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding()),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
