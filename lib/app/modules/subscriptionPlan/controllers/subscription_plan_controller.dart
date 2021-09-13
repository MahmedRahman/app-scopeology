import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class SubscriptionPlanController extends GetxController {
  //TODO: Implement SubscriptionPlanController

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

  getCategory() async{
   ResponsModel responsModel = await WebServices().getCategory();
   if(responsModel.success){
     return responsModel.data.body['Packages'];
   }
  }
}
