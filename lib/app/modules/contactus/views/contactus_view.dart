import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/component.dart';

import '../controllers/contactus_controller.dart';

class ContactusView extends GetView<ContactusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defualtAppBar(title: 'Contact Us'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            iconBadge(picture: 'images/call.svg'),
            SizedBox(
              height: 10,
            ),
            defaultTextFormField(
              hintText: 'Your Name',
              controller: controller.Name,
            ),
            SizedBox(
              height: 10,
            ),
            defaultTextFormField(
              hintText: 'Phone',
              controller: controller.phone,
            ),
            SizedBox(
              height: 10,
            ),
            defaultTextFormField(
              hintText: 'Message',
              controller: controller.Feedback,
            ),
            SizedBox(
              height: 10,
            ),
            defaultbnt(text: 'Send' , onPressed: (){
              controller.setFeedback();
            })
          ],
        ),
      ),
    );
  }
}
