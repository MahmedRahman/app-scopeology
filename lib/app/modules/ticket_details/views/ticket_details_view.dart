import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/CustomImageCached.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/ticket_details_controller.dart';

class TicketDetailsView extends GetView<TicketDetailsController> {
  var data;
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    return Scaffold(
      appBar: defualtAppBar(title: 'Ticket Details'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomImageCached(imageUrl:'https://scopeology.com/Files/Course/${data[0]['Image']}'),
            Text(
                'Cardiology, Neurology, Pulmonology Cardiology, Neurology, Pulmonology Cardiology, Neurology'),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text('From   '),
              subtitle: Text(data[0]['From']),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text('To   '),
              subtitle: Text(data[0]['To']),
            ),
            SizedBox(
              height: 10,
            ),
            Text('You will 2520 SR pay For one seat'),
            SizedBox(
              height: 10,
            ),
            defaultbnt(
                text: 'Get A Seat Now',
                onPressed: () {
                  Get.toNamed(Routes.TICKET_DETAILS);
                }),
          ],
        ),
      ),
    );
  }
}
