import 'package:get/get.dart';
import 'package:halalin/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:halalin/app/modules/splashscreen/view/splashscreen_view.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController());
  }

}