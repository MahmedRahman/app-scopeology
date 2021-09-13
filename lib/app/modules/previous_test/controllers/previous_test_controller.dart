import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';
import 'package:scopeology/app/modules/exam/views/exam_view.dart';

class PreviousTestController extends GetxController {
  //TODO: Implement PreviousTestController

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

  detailExam({@required examId}) {
    WebServices().getExamDetailes(examId: examId).then(
      (responsModel) {
        if (responsModel.success) {
          Get.to(
            ExamView(responsModel.data.body),
            fullscreenDialog: true,
          );

          print(responsModel.data.bodyString);
        }
      },
    );
  }
}
