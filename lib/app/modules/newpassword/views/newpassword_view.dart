import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/newpassword_controller.dart';

class NewpasswordView extends GetView<NewpasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Password'),
        centerTitle: true,
        backgroundColor: KprimaryColor,
        elevation: 0,
      ),
      body: Container(
        color: KprimaryColor,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        defaultLogo(),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Create New Password',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Please enter your new password and confirm',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        defaultTextFormField(hintText: 'Password'),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(hintText: 'Confirm Password'),
                        SizedBox(
                          height: 20,
                        ),
                        defaultbnt(
                            text: 'Confirm',
                            onPressed: () {
                              Get.bottomSheet(defaultbottomSheet(
                                  text: 'Password has been updated Successfully',
                                  onPressed: () {
                                    Get.toNamed(Routes.SIGNIN);
                                  },
                                  svgPicture: 'images/Group 22140.svg',
                                  elevatedButtonText: 'Done'));
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
