import 'package:get/get.dart';

import '../controllers/previous_test_controller.dart';

class PreviousTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviousTestController>(
      () => PreviousTestController(),
    );
  }
}
