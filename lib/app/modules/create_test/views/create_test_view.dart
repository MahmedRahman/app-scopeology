import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/ListAnimator.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/create_test_controller.dart';

class CreateTestView extends GetView<CreateTestController> {
  CreateTestController controller= Get.put(CreateTestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListAnimator(
        children: [
          testCard(
              cardColor: Color(0xff125E51),
              title: 'Revision Exam Mode',
              description:
                  'Customize your own test by choosing the topics and number of questions. While taking the exam:After submitting each answer, the correct answer will be shown with explanation and reference.',
              onTap: () {
                controller.startDemoExam();
                //Get.toNamed(Routes.EXAM);
              }),
          testCard(
              cardColor: Color(0xffD45638),
              title: 'Final Exam Mode',
              description:
                  ' In this mode, we are giving you the opportunity to live the experience of real exam, a fixed number of questions (120 Questions assigned randomly to be taken in 3 hours period). We suggest taking this exam after you’re fully prepared “ Exam can’t be interrupted ”.  "correct answers and explanation will Not be shown".',
              onTap: () {
                if (IsSubscribed.value == false) {

                  Get.bottomSheet(defaultbottomSheet(
                      text:
                          'Demo version is restricted to a fixed “10 questions” in revision mode However, paid subscribers have access to all questions with all features available',
                      onPressed: () {
                        Get.toNamed(Routes.SUBSCRIPTION_PLAN);
                      },
                      svgPicture: 'images/Group 37002.svg',
                      elevatedButtonText: 'Access my Subscription')
                      
                      
                      
                      );
                }
              }),
        ],
      ),
    );
  }

  Widget testCard(
          {@required Color cardColor,
          @required String title,
          @required String description,
          Function onTap}) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: cardColor.withOpacity(.5),
                              borderRadius: new BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: SvgPicture.asset(
                                'images/test.svg',
                                color: cardColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        description,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
