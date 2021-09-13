import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/CustomImageCached.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/medical_calendar_controller.dart';

class MedicalCalendarView extends GetView<MedicalCalendarController> {
  MedicalCalendarController controller = Get.put(MedicalCalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.grey,
            icon: Icon(Icons.notifications),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Medical Calendar',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Text(
              'Browse Medical Events',
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    
    
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
              future: controller.getCourse(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.length.toString());
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        snapshot.data.length,
                        (index) => defultEventCard(
                            date: snapshot.data[index]['To'],
                            imagePath: snapshot.data[index]['Image'],
                            onTap: () {
                              Get.toNamed(Routes.EVENT_DETAILS ,arguments: [snapshot.data[index]]);
                            }),
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }

  defultEventCard({
    @required String date,
    @required String imagePath,
    @required Function onTap,
  }) =>
      Card(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                height: 100,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CustomImageCached(
                      imageUrl: 'https://scopeology.com/Files/Course/$imagePath'),
                ),
              ),
              Container(
                child: Text(date),
              ),
              Container(
                child: Text('Cardiology, Neurology, Pulmonology'),
              ),
            ],
          ),
        ),
      );
}
