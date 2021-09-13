import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/CustomImageCached.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:scopeology/app/modules/exam/views/my_flutter_app_icons.dart';
import '../controllers/exam_controller.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

import 'package:percent_indicator/percent_indicator.dart';

class ExamView extends GetView<ExamController> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  ExamController controller = Get.put(ExamController());

  var data;
  var QusetionIndex = 0;
  var Qusetionlength = 0.obs;
  var QusetionCurrent = 0.obs;

  var Answer = 0.obs;
  var AnswerSelect = 1.obs;
  var AnswerRight = 0;

  TextEditingController textEditingController = new TextEditingController();

  ExamView(this.data);

  header() => Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question #${QusetionCurrent.value.toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            'Total ${Qusetionlength.value.toString()} Question'),
                      ],
                    ),
                  ),
                  SpeedDial(
                    elevation: 0,
                    backgroundColor: Color(0xffD4AF38).withOpacity(.3),
                    icon: MyFlutterApp.filter,
                    iconTheme: IconThemeData(color: Color(0xffD4AF38)),
                    direction: SpeedDialDirection.Down,
                    children: [
                      SpeedDialChild(
                        child: Text(
                          '${data['QuestionsCount'].toString()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Color(0xff125E51).withOpacity(.5),
                        label: 'Questions Count',
                        visible: true,
                        onTap: () {},
                      ),
                      SpeedDialChild(
                        child: Text(
                          '${(data['QuestionsCount'] - data['NotAnswered']).toString()}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Color(0xff125E51).withOpacity(.5),
                        label: 'Answers',
                        visible: true,
                        onTap: () {},
                      ),
                      SpeedDialChild(
                        child: Text(
                          '${data['NotAnswered'].toString()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Color(0xff125E51).withOpacity(.5),
                        label: 'Not Answered',
                        visible: true,
                        onTap: () {},
                      ),
                      SpeedDialChild(
                        child: Text(
                          '${data['Flagged']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Color(0xff125E51).withOpacity(.5),
                        label: 'Flagged',
                        visible: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SpeedDial(
                    elevation: 0,
                    backgroundColor: Color(0xff125E51).withOpacity(.3),
                    icon: MyFlutterApp.info,
                    iconTheme: IconThemeData(color: Color(0xff125E51)),
                    direction: SpeedDialDirection.Down,
                    children: [
                      SpeedDialChild(
                        elevation: 0,
                        child: Image.asset('images/star.png'),
                        backgroundColor: Color(0xffD4AF38).withOpacity(.2),
                        label: 'Book Mark',
                        visible: true,
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Book Mark',
                            content: TextFormField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                              ),
                            ),
                            confirm: defaultbnt(
                              text: 'Send',
                              onPressed: () {
                                controller
                                    .setBookmark(
                                  note: textEditingController.text,
                                )
                                    .then((value) {
                                  // FocusScope.of().unfocus();

                                  Get.back();
                                });
                              },
                            ),
                          );
                        },
                      ),
                      SpeedDialChild(
                        elevation: 0,
                        child: Image.asset('images/flags.png'),
                        backgroundColor: Color(0xff369632).withOpacity(.2),
                        label: 'Flags',
                        visible: true,
                        onTap: () {
                          controller.setExamFlage().then((value) => {
                                Get.bottomSheet(defaultbottomSheet(
                                    text: 'Question has been flagged',
                                    onPressed: () {
                                      Get.back();
                                    },
                                    svgPicture: 'images/flags.svg',
                                    elevatedButtonText: 'Back'))
                              });
                        },
                      ),
                      SpeedDialChild(
                        elevation: 0,
                        child: Image.asset('images/flask.png'),
                        backgroundColor: Color(0xff2E75A8).withOpacity(.2),
                        label: 'Lab value',
                        visible: true,
                        onTap: () {
                          Get.bottomSheet(Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Choose Title',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                              'We will preview lab values for it'),
                                        ],
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          }),
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Table(
                                  border: TableBorder.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  children: [
                                    TableRow(children: [
                                      Column(children: [
                                        Text('Key',
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
                                      Column(children: [
                                        Text('Reference',
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
                                    ]),
                                    TableRow(children: [
                                      Column(children: [
                                        Text('Key',
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
                                      Column(children: [
                                        Text('Reference',
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
                                    ]),
                                    TableRow(children: [
                                      Column(children: [
                                        Text('Key',
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
                                      Column(children: [
                                        Text('Reference',
                                            style: TextStyle(fontSize: 20.0))
                                      ]),
                                    ]),
                                  ],
                                )
                              ],
                            ),
                          ));
                        },
                      ),
                      SpeedDialChild(
                        elevation: 0,
                        child: Image.asset('images/calculator.png'),
                        backgroundColor: Color(0xff3A3EA3).withOpacity(.2),
                        label: 'calculator',
                        visible: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SpeedDial(
                    elevation: 0,
                    backgroundColor: Color(0xffD4AF38).withOpacity(.9),
                    child: Icon(Icons.exit_to_app),
                    direction: SpeedDialDirection.Down,
                    children: [
                      SpeedDialChild(
                        child: Icon(Icons.stop),
                        label: 'Finish',
                        onTap: () {
                          controller.setFinish();
                        },
                      ),
                      SpeedDialChild(
                        child: Icon(Icons.pause),
                        label: 'Pause',
                        onTap: () {
                          controller.setPause();
                        },
                      ),
                      SpeedDialChild(
                        child: Icon(Icons.feedback),
                        label: 'Feed Back',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearPercentIndicator(
                lineHeight: 10,
                percent: QusetionCurrent.value / Qusetionlength.value,
                progressColor: KbntColor,
              ),
            ),
          ],
        );
      });

  @override
  Widget build(BuildContext context) {
    Qusetionlength.value = data['Questions'].length;
    QusetionCurrent.value = 1;

    controller.examId = data['Id'].toString();

    print(controller.examId.toString());
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            header(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: contant(),
            ),
            footer(),
          ],
        ),
      ),
    );
  }

  Widget contant() => Container(
        child: ExpandablePageView.builder(
          itemCount: data['Questions'].length,
          onPageChanged: (int val) {
            QusetionIndex = val;
            data['Questions'][QusetionIndex]['Answer'] == 0
                ? AnswerSelect.value = 1
                : AnswerSelect.value =
                    data['Questions'][QusetionIndex]['Answer'];

            QusetionCurrent.value = val + 1;
            Answer.value = 0;

            print('xxxxxxxxxxxxxxxxx');
            print('QusetionIndex ${QusetionIndex.toString()}');
            //print('RightAnswer ${AnswerRight.toString()}');
            //print('Answer ${Answer.toString()}');
            print('------------');
          },
          itemBuilder: (context, index) {
            Answer.value = data['Questions'][index]['Answer'];
            controller.questionId = data['Questions'][index]['Id'].toString();

            return Column(
              children: [
                qusertionImage(index: QusetionIndex),
                qusertionTitle(index: QusetionIndex),
                qusertionAnswer(index: QusetionIndex),
                explanation(index: QusetionIndex)
              ],
            );
          },
          controller: _controller,
        ),
      );

  Widget qusertionImage({index}) => Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: List.generate(data['Questions'][index]['Images'].length,
              (Imagesindex) {
            return SizedBox(
              width: 150,
              child: CustomImageCached(
                imageUrl:
                    'https://scopeology.com/Files/Question/${data['Questions'][index]['Images'][Imagesindex]['Image']}',
              ),
            );
          }),
        ),
      );

  Widget qusertionTitle({index}) => Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data['Questions'][index]['Question'].toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );

  Widget qusertionAnswer({index}) {
    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              width: Get.width,
              child: Text(
                'Choose answer ..',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Container(
            color: Colors.white60,
            child: Column(
              children: [
                defualtCard(
                    title: data['Questions'][index]['AnswerA'].toString(),
                    isSelected: AnswerSelect.value == 1 ? true : false,
                    status: data['Questions'][index]['Answer'] == 0
                        ? QuestionStatus.NotAnswer
                        : data['Questions'][index]['RightAnswer'] == 1
                            ? QuestionStatus.AnswerRight
                            : data['Questions'][index]['Answer'] == 1
                                ? QuestionStatus.AnswerWrong
                                : QuestionStatus.NotAnswer,
                    onTap: () {
                      AnswerSelect.value = 1;
                    }),
                defualtCard(
                    title: data['Questions'][index]['AnswerB'].toString(),
                    isSelected: AnswerSelect.value == 2 ? true : false,
                    status: data['Questions'][index]['Answer'] == 0
                        ? QuestionStatus.NotAnswer
                        : data['Questions'][index]['RightAnswer'] == 2
                            ? QuestionStatus.AnswerRight
                            : data['Questions'][index]['Answer'] == 2
                                ? QuestionStatus.AnswerWrong
                                : QuestionStatus.NotAnswer,
                    onTap: () {
                      AnswerSelect.value = 2;
                    }),
                defualtCard(
                    title: data['Questions'][index]['AnswerC'].toString(),
                    isSelected: AnswerSelect.value == 3 ? true : false,
                    status: data['Questions'][index]['Answer'] == 0
                        ? QuestionStatus.NotAnswer
                        : data['Questions'][index]['RightAnswer'] == 3
                            ? QuestionStatus.AnswerRight
                            : data['Questions'][index]['Answer'] == 3
                                ? QuestionStatus.AnswerWrong
                                : QuestionStatus.NotAnswer,
                    onTap: () {
                      AnswerSelect.value = 3;
                    }),
                defualtCard(
                    title: data['Questions'][index]['AnswerD'].toString(),
                    isSelected: AnswerSelect.value == 4 ? true : false,
                    status: data['Questions'][index]['Answer'] == 0
                        ? QuestionStatus.NotAnswer
                        : data['Questions'][index]['RightAnswer'] == 4
                            ? QuestionStatus.AnswerRight
                            : data['Questions'][index]['Answer'] == 4
                                ? QuestionStatus.AnswerWrong
                                : QuestionStatus.NotAnswer,
                    onTap: () {
                      AnswerSelect.value = 4;
                    }),
                GetUtils.isNullOrBlank(data['Questions'][index]['AnswerE'])
                    ? Container()
                    : defualtCard(
                        title: data['Questions'][index]['AnswerE'].toString(),
                        isSelected: AnswerSelect.value == 5 ? true : false,
                        status: data['Questions'][index]['Answer'] == 0
                            ? QuestionStatus.NotAnswer
                            : data['Questions'][index]['RightAnswer'] == 5
                                ? QuestionStatus.AnswerRight
                                : data['Questions'][index]['Answer'] == 5
                                    ? QuestionStatus.AnswerWrong
                                    : QuestionStatus.NotAnswer,
                        onTap: () {
                          AnswerSelect.value = 5;
                        }),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget explanation({index}) => data['Questions'][index]['Answer'] == 0
      ? SizedBox.shrink()
      : Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  width: Get.width,
                  child: Text(
                    'Explanation ..',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      data['Questions'][index]['AnswerImages'].length,
                      (Imagesindex) => SizedBox(
                            width: 150,
                            child: CustomImageCached(
                              imageUrl:
                                  'https://scopeology.com/Files/Answer/${data['Questions'][index]['AnswerImages'][Imagesindex]['Image']}',
                            ),
                          )),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data['Questions'][index]['AnswerExplanation'].toString(),
                  ),
                ),
              ),
            ],
          ),
        );

  Widget footer() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            defaultbnt(
                text: 'Submit',
                onPressed: () {
                  data['Questions'][QusetionIndex]['Answer'] =
                      AnswerSelect.value;
                  controller.setAnswer(answer: AnswerSelect.value.toString());
                  AnswerSelect.value = -1;
                }),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: defaultbnt(
                        text: 'Back',
                        onPressed: () {
                          _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: defaultbnt(
                        text: 'Next',
                        onPressed: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  Widget defualtCard(
          {@required String title,
          @required bool isSelected,
          QuestionStatus status,
          Function onTap}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          child: InkWell(
            onTap: onTap,
            child: Container(
              color: status == QuestionStatus.NotAnswer
                  ? isSelected
                      ? Colors.blueGrey.withOpacity(.5)
                      : Color(0xff8B8DA9).withOpacity(.2)
                  : AnswerColor(status),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ),
      );
}

Color AnswerColor(QuestionStatus status) {
  switch (status) {
    case QuestionStatus.NotAnswer:
      return Colors.grey;
      break;
    case QuestionStatus.AnswerRight:
      return Color(0xff34AD6C).withOpacity(.5);
      break;
    case QuestionStatus.AnswerWrong:
      return Color(0xffAD3434).withOpacity(.5);
      break;
    default:
  }
}

enum QuestionStatus { AnswerRight, AnswerWrong, NotAnswer }
