import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';
import 'package:scopeology/app/modules/exam/views/exam_view.dart';

class CreateTestController extends GetxController {
  //TODO: Implement CreateTestController

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

  Future startDemoExam() async {
    await WebServices().startDemoExam().then((responsModel) {
      if (responsModel.success) {
        if (responsModel.data.body['IsSuccess']) {
          WebServices()
              .getExamDetailes(
                  examId: responsModel.data.body['Data'].toString())
              .then((responsModel) {
            if (responsModel.success) {

              Get.to(
                ExamView(responsModel.data.body),
                fullscreenDialog: true,
              );
              
              print(responsModel.data.bodyString);
            }
          });
        } else {
          Fluttertoast.showToast(msg: responsModel.data.body['Message']);
        }
      }
    });
  }
}
