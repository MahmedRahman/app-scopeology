import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/ListAnimator.dart';

import '../controllers/previous_test_controller.dart';

class PreviousTestView extends GetView<PreviousTestController> {
  PreviousTestController controller = Get.put(PreviousTestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: controller.getExam(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListAnimator(
                children: List.generate(
                  snapshot.data.length,
                  (index) => previousTestCard(
                      Date: snapshot.data[index]['Date'].toString(),
                      Correct: snapshot.data[index]['RightAnswers'].toString(),
                      Incorrect:
                          snapshot.data[index]['NotRightAnswer'].toString(),
                      Total: snapshot.data[index]['QuestionsCount'].toString(),
                      Percentage: (snapshot.data[index]['RightAnswers'] /
                              snapshot.data[index]['QuestionsCount'])
                          .toString(),
                      Topics:
                          snapshot.data[index]['Topics'].join(" , ").toString(),
                      onTap: () {
                        controller.detailExam(
                          examId: snapshot.data[index]['Id'].toString(),
                        );
                      }),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget previousTestCard(
          {@required Date,
          @required Percentage,
          @required Correct,
          @required Incorrect,
          @required Total,
          @required Topics,
          Function onTap}) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(Topics,
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      subtitle: Text(
                        '2021-06-02',
                        textAlign: TextAlign.right,
                      ),
                      leading: Container(
                        color: Color(0xffD4AF38).withOpacity(.5),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset('images/previoustest.svg'),
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('Percentage'),
                            Text('${Percentage}%')
                          ],
                        ),
                        Column(
                          children: [Text('Correct'), Text(Correct)],
                        ),
                        Column(
                          children: [Text('Incorrect'), Text(Incorrect)],
                        ),
                        Column(
                          children: [Text('Total'), Text(Total)],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
