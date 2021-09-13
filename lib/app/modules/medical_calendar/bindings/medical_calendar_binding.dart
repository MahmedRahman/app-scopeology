import 'package:get/get.dart';

import '../controllers/medical_calendar_controller.dart';

class MedicalCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalCalendarController>(
      () => MedicalCalendarController(),
    );
  }
}
