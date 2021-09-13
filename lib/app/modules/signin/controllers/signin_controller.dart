import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:scopeology/api/auth.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/routes/app_pages.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    email.text = 'ATP2020@outlook.com';
    pass.text = '123456';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void siginWithEmail() async {
    await WebServices()
        .siginWithEmail(
      email: email.text,
      password: pass.text,
    )
        .then((Response response) async {
      Get.find<UserAuth>().setUserToken(response.body['access_token']);

      ResponsModel responsModel = await WebServices().getProfile();

      if (responsModel.success) {
        Kusername.value = responsModel.data.body['Name'];
        KuserPhone.value = responsModel.data.body['PhoneNumber'];
        KuserEmail.value = responsModel.data.body['Email'];
        KuserCategory.value = responsModel.data.body['CategoryName'];

        KHospital.value = responsModel.data.body['Hospital'];
        KGraduationYear.value =
            responsModel.data.body['GraduationYear'].toString();

        IsSubscribed.value = responsModel.data.body['IsSubscribed'];

        KCategoryId.value = responsModel.data.body['CategoryId'].toString();

        Get.offAllNamed(Routes.LAYOUT);
      }
    }, onError: (err) {
      Fluttertoast.showToast(msg: 'Password error');
    });
  }
}
