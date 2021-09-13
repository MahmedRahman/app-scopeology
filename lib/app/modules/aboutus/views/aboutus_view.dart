import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/data/component.dart';

import '../controllers/aboutus_controller.dart';

class AboutusView extends GetView<AboutusController> {
  AboutusController controller = Get.put(AboutusController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7F7),
      appBar: defualtAppBar(title: 'Termes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
                right: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  iconBadge(picture: 'images/info.svg'),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          TermsPage.value,
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
