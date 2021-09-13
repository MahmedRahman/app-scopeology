import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:scopeology/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            IconButton(
              // ,
              onPressed: () {},
              color: Colors.grey, icon: Icon(Icons.notifications),
            ),
          ],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey Dr ,',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Text(
                'Welcome to Scopeology',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              title(title: 'Features & Benefits'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: [
                    features(
                        svgPicture: 'images/brain.svg',
                        title: 'Test Modes',
                        description:
                            'Revision mode, timed tests, extensive performance analysis and powerful question review functions.',
                        cardColor: Color(0xff125E51)),
                    features(
                        svgPicture: 'images/feather.svg',
                        title: 'Graphics',
                        description:
                            'colorful images and tables supplement the overall learning experience with Detailed performance graphs.',
                        cardColor: Color(0xffD4AF38)),
                    features(
                        svgPicture: 'images/idea.svg',
                        title: 'Key Learning Points',
                        description:
                            'Every question tests a key learning point, each revision session you complete ends with a memorable summary of key points you’ve covered.',
                        cardColor: Color(0xffAD3057)),
                    features(
                        svgPicture: 'images/feedback.svg',
                        title: 'Feedback',
                        description:
                            'User feedback and scoring data is constantly analyzed to allow exclusion of any underperforming questions.',
                        cardColor: Color(0xff5731AD)),
                  ],
                ),
              ),
              title(title: 'Our Content'),
              content(
                title: 'Covering all topics in Medicine, Surgery and Ob/Gyn specialties. “more specialties to be added soon”.'
              ),
              content(
                title: 'We ensure that our contents are comprehensive, referenced to major medical textbooks and clinical resources, up-to-date explanations from the literature and evidence based rationales.'
              ),
              content(
                title: 'Detailed graphs to show your overall performance.'
              ),
              content(
                title: 'Simple, user friendly website that allows you to create and customize your own test.'
              ),
                         content(
                title: 'Our questions undergo multiple stages of intensive review and revision to ensure accuracy and appropriate difficulty levels.'
              ),
              content(title: 'Our question banks are a great way to judge your overall preparedness to estimate what your score might be on the real exam.')
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: 0,
          showElevation: true, // use this to remove appBar's elevation

          items: [
            BottomNavyBarItem(
              icon: SvgPicture.asset('images/home_menu_0.svg',
                  color: KprimaryColor),
              title: Center(child: Text('Home')),
              activeColor: KprimaryColor.withOpacity(.5),
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset('images/home_menu_1.svg',
                  color: KprimaryColor),
              title: Center(child: Text('Home')),
              activeColor: KprimaryColor.withOpacity(.5),
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset('images/home_menu_2.svg',
                  color: KprimaryColor),
              title: Center(child: Text('Home')),
              activeColor: KprimaryColor.withOpacity(.5),
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset('images/home_menu_3.svg',
                  color: KprimaryColor),
              title: Center(child: Text('Home')),
              activeColor: KprimaryColor.withOpacity(.5),
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset('images/home_menu_4.svg',
                  color: KprimaryColor),
              title: Center(child: Text('Home')),
              activeColor: KprimaryColor.withOpacity(.5),
            ),
          ],
          onItemSelected: (int value) {
            //selectindex.value = value;
            Get.bottomSheet(defaultbottomSheet(
                text: 'You are not signed in yet Please sign in to access it',
                onPressed: () {
                  Get.toNamed(Routes.SIGNIN);
                },
                svgPicture: 'images/Group 37002.svg',
                elevatedButtonText: 'Sign in Now'));
          },
        ));
  }
}

Widget title({String title}) => SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget features({
  @required String svgPicture,
  @required String title,
  @required String description,
  @required Color cardColor,
}) =>
    Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        color: cardColor.withOpacity(.5)),
                    Positioned(
                      left: 35,
                      child: SvgPicture.asset(
                        svgPicture,
                        color: cardColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Text(
                  description,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget content({@required String title}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              color: Color(0xffFCF4DF),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('images/content-marketing.svg'),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
