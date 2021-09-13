import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class ContactusController extends GetxController {
  //TODO: Implement ContactusController

  TextEditingController Name = new TextEditingController();
  TextEditingController Feedback = new TextEditingController();
  TextEditingController phone = new TextEditingController();

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

  setFeedback() async {
    ResponsModel responsModel = await WebServices().setFeedback(
      Name: Name.text,
      Body: Feedback.text,
      PhoneNumber: phone.text,
    );
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
}
