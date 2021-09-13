import 'package:get/get.dart';

import '../controllers/create_test_controller.dart';

class CreateTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTestController>(
      () => CreateTestController(),
    );
  }
}
