import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/data/component.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  PageController pageController;
  var selectPage = 1.obs;
  var selectGender = 1.obs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    pageController = new PageController();
    controller.Gender.text = '1';
    controller.GeaduationYear.text = '1';
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: Form(
        key: _formKey,
        child: ListView(
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
                      height: 20,
                    ),
                    Obx(() {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          stepBnt(
                              title: '1',
                              isSelected: selectPage.value == 1 ? true : false,
                              onTap: () {
                                pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              }),
                          SizedBox(
                            width: 15,
                          ),
                          stepBnt(
                              title: '2',
                              isSelected: selectPage.value == 2 ? true : false,
                              onTap: () {
                                pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              }),
                          SizedBox(
                            width: 15,
                          ),
                          stepBnt(
                              title: '3',
                              isSelected: selectPage.value == 3 ? true : false,
                              onTap: () {
                                pageController.animateToPage(2,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              }),
                        ],
                      );
                    }),
                    ExpandablePageView.builder(
                        onPageChanged: (int page) {
                          selectPage.value = page + 1;
                        },
                        controller: pageController,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                defaultTextFormField(
                                  hintText: 'First Name',
                                  controller: controller.FirstName,
                                  keyboardType: TextInputType.text,
                                  validator: (v) => v.isNotEmpty
                                      ? null
                                      : 'This field is required',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultTextFormField(
                                  hintText: 'Last Name',
                                  controller: controller.LastName,
                                  keyboardType: TextInputType.text,
                                  validator: (v) => v.isNotEmpty
                                      ? null
                                      : 'This field is required',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Obx(() {
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        child: Center(child: Text('Gender')),
                                        height: 60,
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GenderItem(
                                          title: 'Male',
                                          isSelected: selectGender.value == 1
                                              ? true
                                              : false,
                                          onTap: () {
                                            selectGender.value = 1;
                                            controller.Gender.text = '1';
                                          }),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GenderItem(
                                          title: 'Female',
                                          isSelected: selectGender.value == 2
                                              ? true
                                              : false,
                                          onTap: () {
                                            selectGender.value = 2;
                                            controller.Gender.text = '2';
                                          }),
                                    ],
                                  );
                                }),
                              ],
                            );
                          } else if (index == 1) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                DropdownButtonFormField(
                                  decoration: new InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'Category'),
                                  validator: (v) => v.isNotEmpty
                                      ? null
                                      : 'This field is required',
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: [],
                                  onChanged: (val) {
                                    print(val);
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultTextFormField(
                                  hintText: 'Hospital',
                                  controller: controller.Hospital,
                                  keyboardType: TextInputType.text,
                                  validator: (v) => v.isNotEmpty
                                      ? null
                                      : 'This field is required',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                DropdownButtonFormField(
                                  decoration: new InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'Graduation Year'),
                                  validator: (v) => v.isNotEmpty
                                      ? null
                                      : 'This field is required',
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('R1'),
                                      value: '1',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('R2'),
                                      value: '2',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('R3'),
                                      value: '3',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('R4'),
                                      value: '4',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('R5'),
                                      value: '5',
                                    ),
                                  ],
                                  onChanged: (val) {
                                    controller.GeaduationYear.text = val;
                                  },
                                ),
                              ],
                            );
                          } else if (index == 2) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                defaultTextFormField(
                                  hintText: 'Email',
                                  controller: controller.Email,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (v) => v.isNotEmpty
                                      ? null
                                      : 'This field is required',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultTextFormField(
                                  hintText: 'Password',
                                  controller: controller.Password,
                                  obscureText: true,
                                  validator: (v) => v.isNotEmpty
                                      ? null
                                      : 'This field is required',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultTextFormField(
                                  hintText: 'Phone Number',
                                  controller: controller.PhoneNumber,
                                  keyboardType: TextInputType.phone,
                                  validator: (v) => v.isNotEmpty
                                      ? null
                                      : 'This field is required',
                                ),
                              ],
                            );
                          }
                          return Text('data');
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    defaultbnt(
                        text: 'Next',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            controller.registerAccount();
                          } else {
                            print('object');
                          }

                          //Get.toNamed(Routes.LAYOUT);
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        defaultText(text: 'Have an account ?'),
                        defaultText(text: 'Login Now'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GenderItem({@required title, bool isSelected = false, Function onTap}) =>
      Expanded(
          child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? KbntColor : Colors.white,
            border: Border.all(
              color: isSelected ? Colors.grey : KbntColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          )),
          height: 60,
        ),
      ));

  stepBnt({
    @required title,
    bool isSelected = false,
    Function onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: isSelected ? Color(0xffD8AF46) : Color(0xffF3F3F3),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Color(0xffF3F3F3) : KbntColor),
          ),
        ),
      );
}
