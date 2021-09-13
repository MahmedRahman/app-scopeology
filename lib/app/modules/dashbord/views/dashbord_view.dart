import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:scopeology/app/data/ListAnimator.dart';

import '../controllers/dashbord_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class DashbordView extends GetView<DashbordController> {
  DashbordController controller = Get.put(DashbordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListAnimator(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: SizedBox(
                height: 250,
                child: Container(
                    child: Image.asset(
                        'images/image_chart1.png') //defualtlineChart(),
                    ),
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(child: Image.asset('images/image_chart2.png')),
                  Expanded(child: Image.asset('images/image_chart2.png'))
                  //defualtlineChart(),
                  //defualtlineChart(),
                ],
              ),
            ),
            Container(
              child: SizedBox(
                height: 250,
                child: Container(
                    child: Image.asset(
                        'images/image_chart3.png') //defualtlineChart(),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Previous Test'),
                  Text('See all'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: controller.getExam(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: List.generate(
                      snapshot.data.length,
                      (index) => defualtBoxItem(
                        Date:snapshot.data[index]['Date'],
                        Topics: snapshot.data[index]['Topics'].join(" , ").toString()
                      ),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

defualtBoxItem({@required Date , @required Topics}) => Card(
      child: ListTile(
        title: Text(
          Topics,
          style: TextStyle(fontSize: 12),
        ),
        subtitle: Text(
          Date,
          textAlign: TextAlign.right,
        ),
        leading: Container(
          color: Color(0xffD4AF38).withOpacity(.4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('images/idea.svg'),
          ),
        ),
      ),
    );

Container defualtlineChart() => Container(
      child: LineChart(
        LineChartData(
            backgroundColor: Colors.white,
            axisTitleData: FlAxisTitleData(
                show: true,
                bottomTitle: AxisTitle(showTitle: true, titleText: 'hi')),
            lineBarsData: [
              LineChartBarData(spots: [
                FlSpot(10, 10),
                FlSpot(20, 20),
                FlSpot(30, 30),
              ])
            ]),
        swapAnimationDuration: Duration(
          milliseconds: 150,
        ), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
    );
