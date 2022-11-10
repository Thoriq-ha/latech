import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/splashscreen/view/splashscreen_view.dart';
import 'package:halalin/app/routes/app_pages.dart';

class SplashScreenController extends GetxController{
  //TODO: Implement SplashController

  final count = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void increment() => count.value++;

  void movePage() {
    Future.delayed(const Duration(seconds: splashDuration)).then((value) => Get.offNamed(Routes.HOME) );
  }
}