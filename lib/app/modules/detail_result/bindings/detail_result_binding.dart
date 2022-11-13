import 'package:get/get.dart';

import '../controllers/detail_result_controller.dart';

class DetailResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailResultController>(
      () => DetailResultController(),
    );
  }
}
