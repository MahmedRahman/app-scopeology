import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KSecondaryColor,
      body: Center(child: Image.asset('images/logo.png')),
    );
  }
}
