import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scopeology/api/auth.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Scopeology",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        fontFamily: 'Nunito',
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}

initServices() async {
  await Get.putAsync<UserAuth>(() async => await UserAuth());
}
