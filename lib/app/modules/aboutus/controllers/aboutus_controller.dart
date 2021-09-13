import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';

class AboutusController extends GetxController {
  //TODO: Implement AboutusController

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await rootBundle
        .loadString('images/Terms.txt')
        .then((value) => TermsPage.value = value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
