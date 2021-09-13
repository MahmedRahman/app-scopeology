import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class BookmarkController extends GetxController {
  //TODO: Implement BookmarkController

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

  getBookmark() async {
    ResponsModel responsModel = await WebServices().getBookmark();
    if(responsModel.success){
        Response response = responsModel.data;
      return response.body;
    }
  }
}
