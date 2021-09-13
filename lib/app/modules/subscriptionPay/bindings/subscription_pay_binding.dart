import 'package:get/get.dart';

import '../controllers/subscription_pay_controller.dart';

class SubscriptionPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionPayController>(
      () => SubscriptionPayController(),
    );
  }
}
