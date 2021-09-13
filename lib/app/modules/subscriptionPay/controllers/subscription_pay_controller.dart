import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class SubscriptionPayController extends GetxController {
  //TODO: Implement SubscriptionPayController

  TextEditingController promoCode = TextEditingController();

  var price = ''.obs;

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

  setSubscribe() async {

    ResponsModel responsModel = await WebServices()
        .setSubscribe(promoCode: promoCode.text, packageId: '1');

    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        Fluttertoast.showToast(
            msg: responsModel.data.body['Data'].toString());
      } else {
        Fluttertoast.showToast(
            msg: responsModel.data.body['Message'].toString());
      }
    }
  }

  getPromoCode() async {
    ResponsModel responsModel = await WebServices()
        .getPromoCode(promoCode: promoCode.text, packageId: '1');

    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        if (responsModel.data.body['Data']['DiscountType'].toString() == '1') {
          var discountprice = double.parse(price.value) -
              responsModel.data.body['Data']['Discount'];

          price.value = discountprice.toString();
        }
      } else {
        Fluttertoast.showToast(
            msg: responsModel.data.body['Message'].toString());
      }
    }
    promoCode.clear();
    return responsModel.data;
  }
}
