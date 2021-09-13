import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/component.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defualtAppBar(title: 'Feedback'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            iconBadge(picture: 'images/feedback.svg'),
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
              hintText: 'Feedback',
              controller: controller.Feedback,
            ),
            SizedBox(
              height: 10,
            ),
            defaultbnt(
                text: 'Send',
                onPressed: () {
                  controller.setFeedback();
                })
          ],
        ),
      ),
    );
  }
}
