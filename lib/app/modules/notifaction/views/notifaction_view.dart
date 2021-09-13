import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/component.dart';

import '../controllers/notifaction_controller.dart';

class NotifactionView extends GetView<NotifactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defualtAppBar(title: 'Notifaction'),
      body: Column(
        children: [
          NotifactionCard(),
          NotifactionCard(),
        ],
      ),
    );
  }

  Widget NotifactionCard() => Container(
        child: Card(
          child: ListTile(
            title: Text('Cardiology, Neurology, Pulmonology, Rheumatology'),
            subtitle: Text('2021-06-02'),
            leading: Container(
              color: Color(0xffAD3057).withOpacity(.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Icon(
                    Icons.notifications,
                    color: Color(0xffAD3057),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
