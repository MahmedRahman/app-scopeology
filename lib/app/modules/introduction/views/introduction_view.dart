import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

import 'package:introduction_screen/introduction_screen.dart';

class IntroductionView extends GetView<IntroductionController> {
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: Text(
        'Emerging Peacemaker',
        style: TextStyle(
            color: KprimaryColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      bodyWidget: Center(
        child: Text(
            'Sharksucker sea toad candiru rocket danio tilefish stingray deepwater stingray Sacramento northern sea robin zingel lancetfish galjoen fish, catla wolffish, mosshead',textAlign: TextAlign.center ,),
      ),
      image: Image.asset(
        'images/splash01.png',
        width: 200,
      ),
    ),
    PageViewModel(
      titleWidget: Text(
      'Emerging Peacemaker',
        style: TextStyle(
            color: KprimaryColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      bodyWidget: Center(
        child: Text(
            'Sharksucker sea toad candiru rocket danio tilefish stingray deepwater stingray Sacramento northern sea robin zingel lancetfish galjoen fish, catla wolffish, mosshead',textAlign: TextAlign.center ,),
      ),
      image: Image.asset(
        'images/splash02.png',
        width: 200,
      ),
    ),
    PageViewModel(
      titleWidget: Text(
        'Emerging Peacemaker',
        style: TextStyle(
            color: KprimaryColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      bodyWidget: Center(
        child: Text(
            'Sharksucker sea toad candiru rocket danio tilefish stingray deepwater stingray Sacramento northern sea robin zingel lancetfish galjoen fish, catla wolffish, mosshead',textAlign: TextAlign.center ,),
      ),
      image: Image.asset(
        'images/splash03.png',
        width: 200,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: IntroductionScreen(
          pages: listPagesViewModel,
          onDone: () {
             Get.toNamed(Routes.HOME);
          },
          onSkip: () {
         Get.toNamed(Routes.HOME);
          },
          showSkipButton: true,
          skip: Text(
            'Skip',
            style: TextStyle(color: KprimaryColor, fontWeight: FontWeight.bold),
          ),
          next: Text(
            'Next',
            style: TextStyle(color: KprimaryColor, fontWeight: FontWeight.bold),
          ),
          done: Text(
            'Start',
            style: TextStyle(color: KprimaryColor, fontWeight: FontWeight.bold),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: KprimaryColor,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
