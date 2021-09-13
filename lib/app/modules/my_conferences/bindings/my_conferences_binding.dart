import 'package:get/get.dart';

import '../controllers/my_conferences_controller.dart';

class MyConferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyConferencesController>(
      () => MyConferencesController(),
    );
  }
}
