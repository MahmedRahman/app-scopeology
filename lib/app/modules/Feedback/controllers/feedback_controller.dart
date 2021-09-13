import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class FeedbackController extends GetxController {
  //TODO: Implement FeedbackController

  TextEditingController Name = new TextEditingController();
  TextEditingController Feedback = new TextEditingController();

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

  setFeedback() async {
    ResponsModel responsModel =
        await WebServices().setFeedback(Name: Name.text, Body: Feedback.text);
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['IsSuccess']) {
        Fluttertoast.showToast(msg: response.body['Message']);
        Get.back();
      } else {
        Fluttertoast.showToast(msg: response.body['Message']);
         Get.back();
        
      }
    }
  }

  void increment() => count.value++;
}
