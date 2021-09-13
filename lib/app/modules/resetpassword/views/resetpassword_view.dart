import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/resetpassword_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Reset Password '),
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
                        SizedBox(
                            width: Get.width,
                            child: Text(
                              'Reset Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Please Type the 4 digit code that’s been sent to your Email',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(hintText: 'Code'),
                        SizedBox(
                          height: 20,
                        ),
                        defaultbnt(
                            text: 'Next',
                            onPressed: () {
                              Get.toNamed(Routes.NEWPASSWORD);
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Didn’t receive a code?'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Resend Code',
                              style: TextStyle(color: KprimaryColor),
                            ),
                          ],
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
