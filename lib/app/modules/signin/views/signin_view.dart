import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: ListView(
        children: [
          SizedBox(
            height: 75,
          ),
          Container(
            height: Get.height - 75,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  defaultLogo(),
                  SizedBox(
                    height: 30,
                  ),
                  defaultTextFormField(
                    hintText: 'Email',
                    controller: controller.email,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultTextFormField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: controller.pass,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultText(
                      textAlign: TextAlign.end,
                      text: 'Forget Password ?',
                      onTap: () {
                        Get.toNamed(Routes.FORGETPASSWORD);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defaultbnt(
                      text: 'Login',
                      onPressed: () {
                        
                        controller.siginWithEmail();
                        //Get.toNamed(Routes.LAYOUT);
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  defaultText(text: 'Don’t have an account'),
                  SizedBox(
                    height: 40,
                  ),
                  defaultbnt2(
                      text: ' Register Now',
                      onPressed: () {
                        Get.toNamed(Routes.SIGNUP);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    
    );
  }
}
