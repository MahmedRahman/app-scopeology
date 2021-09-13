import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/CustomImageCached.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/event_details_controller.dart';

class EventDetailsView extends GetView<EventDetailsController> {
  var data;
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    return Scaffold(
      appBar: defualtAppBar(title: 'Event Details'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomImageCached(
                imageUrl:
                    'https://scopeology.com/Files/Course/${data[0]['Image']}'),
            Text(
                'Cardiology, Neurology, Pulmonology Cardiology, Neurology, Pulmonology Cardiology, Neurology, Pulmonology '),
            ListTile(
              title: Text('From   '),
              subtitle: Text(data[0]['From']),
            ),
            ListTile(
              title: Text('To   '),
              subtitle: Text(data[0]['To']),
            ),
            defaultbnt(
                text: 'Get A Seat Now',
                onPressed: () {
                  Get.toNamed(
                    Routes.TICKET_DETAILS,
                   arguments: [data[0]],
                  );
                }),
            Text('About this Event'),
            Text(
              data[0]['Description'],
              style: TextStyle(fontSize: 20),
            ),
            Text('Get Event Directions'),
            defaultbnt(
                text: 'Get A Seat Now',
                onPressed: () {
                  Get.toNamed(
                    Routes.TICKET_DETAILS,
                    arguments: [data[0]],
                  );
                }),
            Text('Related Conferences'),
          ],
        ),
      ),
    );
  }
}
