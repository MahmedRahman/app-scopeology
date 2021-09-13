import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class MedicalCalendarController extends GetxController {
  //TODO: Implement MedicalCalendarController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future getCourse() async {
    ResponsModel responsModel = await WebServices().getCourse();
    if (responsModel.success) {
      Response response = responsModel.data;
  
      return response.body;
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
