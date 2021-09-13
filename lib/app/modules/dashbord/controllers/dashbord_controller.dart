import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class DashbordController extends GetxController {
  //TODO: Implement DashbordController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getExam() async {
    ResponsModel responsModel = await WebServices().getExam();
    if (responsModel.success) {
      Response response = responsModel.data;
      return response.body;
    }
  }
}
