import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/modules/bookmark/views/bookmark_view.dart';
import 'package:scopeology/app/modules/create_test/views/create_test_view.dart';
import 'package:scopeology/app/modules/dashbord/views/dashbord_view.dart';
import 'package:scopeology/app/modules/notifaction/views/notifaction_view.dart';
import 'package:scopeology/app/modules/previous_test/views/previous_test_view.dart';
import 'package:scopeology/app/modules/profile/views/profile_view.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  var selectindex = 0.obs;

  List<Widget> screen = [
    DashbordView(),
    CreateTestView(),
    PreviousTestView(),
    BookmarkView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.HOME);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
             
              onPressed: () {
                Get.to(NotifactionView(), fullscreenDialog: true);
              },
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
                '${Kusername.value} - ${KuserCategory.value}',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
     
        body: Obx(() {
          return screen[selectindex.value];
        }),
        bottomNavigationBar: Obx(() {
          return BottomNavyBar(
            selectedIndex: selectindex.value,
            showElevation: true, // use this to remove appBar's elevation
            items: [
              BottomNavyBarItem(
                icon: SvgPicture.asset(
                  'images/home_menu_0.svg',
                  color: KprimaryColor,
                ),
                title: Center(
                  child: Text('Home'),
                ),
                activeColor: KprimaryColor.withOpacity(.5),
              ),
              BottomNavyBarItem(
                icon: SvgPicture.asset('images/home_menu_1.svg',
                    color: KprimaryColor),
                title: Center(
                  child: Text('Create Test'),
                ),
                activeColor: KprimaryColor.withOpacity(.5),
              ),
              BottomNavyBarItem(
                icon: SvgPicture.asset('images/home_menu_2.svg',
                    color: KprimaryColor),
                title: Center(
                  child: Text('Previous Test'),
                ),
                activeColor: KprimaryColor.withOpacity(.5),
              ),
              BottomNavyBarItem(
                icon: SvgPicture.asset('images/home_menu_3.svg',
                    color: KprimaryColor),
                title: Center(
                  child: Text('Bookmark'),
                ),
                activeColor: KprimaryColor.withOpacity(.5),
              ),
              BottomNavyBarItem(
                icon: SvgPicture.asset('images/home_menu_4.svg',
                    color: KprimaryColor),
                title: Center(
                  child: Text('Profile'),
                ),
                activeColor: KprimaryColor.withOpacity(.5),
              ),
            ],
            onItemSelected: (int value) {
              selectindex.value = value;
            },
          );
        }));
  }
}
