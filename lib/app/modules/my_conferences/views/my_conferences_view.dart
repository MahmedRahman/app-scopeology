import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_conferences_controller.dart';

class MyConferencesView extends GetView<MyConferencesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyConferencesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MyConferencesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
