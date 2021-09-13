import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/ListAnimator.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListAnimator(
          children: [
            title(title: 'info'),
            Container(
              child: Column(
                children: [
                  bntListTile(
                      title: 'Medical Calendar',
                      colorTile: Color(0xff1F8A17),
                      subtitle: 'Medical Calendar',
                      imgTitle: 'images/medical.svg',
                      onTap: () {
                        Get.toNamed(Routes.MEDICAL_CALENDAR);
                      })
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  bntListTile(
                      title: 'My Conferences',
                      colorTile: Color(0xffD4AF38),
                      subtitle: 'My Conferences',
                      imgTitle: 'images/medical.svg',
                      onTap: () {
                         Get.toNamed(Routes.MY_CONFERENCES);
                      })
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  bntListTile(
                      title: 'Subscription Plan',
                      colorTile: Color(0xff125E51),
                      subtitle: 'Select Your Plan',
                      imgTitle: 'images/subscription.svg',
                      onTap: () {
                        Get.toNamed(Routes.SUBSCRIPTION_PLAN);
                      })
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  bntListTile(
                    title: 'Phone',
                    subtitle: KuserPhone.value,
                    colorTile: Color(0xff205284),
                    imgTitle: 'images/phone.svg',
                  ),
                  bntListTile(
                    title: 'Email',
                    subtitle: KuserEmail.value,
                    colorTile: Color(0xff84207E),
                    imgTitle: 'images/email.svg',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  bntListTile(
                      title: 'Category',
                      subtitle: KuserCategory.value,
                      colorTile: Color(0xffD4AF38),
                      imgTitle: 'images/category.svg',
                      onTap: () {}),
                  bntListTile(
                      title: 'Hospital',
                      subtitle: KHospital.value,
                      colorTile: Color(0xff125E51),
                      imgTitle: 'images/hospital.svg',
                      onTap: () {}),
                  bntListTile(
                      title: 'Graduation Year',
                      subtitle: KGraduationYear.value,
                      colorTile: Color(0xffBF4646),
                      imgTitle: 'images/graduation_year.svg',
                      onTap: () {}),
                        bntListTile(
                      title: 'City',
                      subtitle:'City',
                      colorTile: Color(0xffC8E0F5),
                      imgTitle: 'images/City.svg',
                      onTap: () {}),
                         bntListTile(
                      title: 'Education Level',
                      subtitle: 'Education Level',
                      colorTile: Color(0xff9EFEDD),
                      imgTitle: 'images/education.svg',
                      onTap: () {}),
                            bntListTile(
                      title: 'SCHFS',
                      subtitle: 'SCHFS',
                      colorTile: Color(0xffF5C8C8),
                      imgTitle: 'images/SCHFS.svg',
                      onTap: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: title(title: 'App Info'),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  bntListTile(
                      title: 'About us',
                      colorTile: Color(0xff125E51),
                      imgTitle: 'images/info.svg',
                      onTap: () {
                        Get.toNamed(Routes.ABOUTUS);
                      }),
                  bntListTile(
                      title: 'Feedback',
                      colorTile: Color(0xff125E51),
                      imgTitle: 'images/feedback.svg',
                      onTap: () {
                        Get.toNamed(Routes.FEEDBACK);
                      }),
                  bntListTile(
                      title: 'Contact Us',
                      colorTile: Color(0xff125E51),
                      imgTitle: 'images/call.svg',
                      onTap: () {
                        Get.toNamed(Routes.CONTACTUS);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title({@required String title}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: Get.width,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget bntListTile({
    Function onTap,
    @required String title,
    String subtitle = '',
    @required Color colorTile,
    @required String imgTitle,
  }) =>
      InkWell(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              leading: Container(
                decoration: BoxDecoration(
                  color: colorTile.withOpacity(.5),
                  borderRadius: new BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    imgTitle,
                    color: colorTile,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              trailing: GetUtils.isNull(onTap)
                  ? SizedBox.shrink()
                  : Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      );
}
