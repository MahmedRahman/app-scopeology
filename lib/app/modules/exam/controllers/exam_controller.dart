import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class ExamController extends GetxController {
  //TODO: Implement ExamController
  var questionId;
  var examId;

  Future setExamFlage() async {
    ResponsModel responsModel =
        await WebServices().setExamFlage(questionId: questionId);

    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        Fluttertoast.showToast(msg: 'done');
      } else {
        Fluttertoast.showToast(msg: 'error');
      }
    }
  }

  setFinish() async {
    ResponsModel responsModel = await WebServices().setFinish(examId: examId);

    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        Fluttertoast.showToast(msg: 'done');
      } else {
        Fluttertoast.showToast(msg: 'error');
      }
    }
  }

  setAnswer({@required String answer}) async {
    ResponsModel responsModel = await WebServices()
        .setAnswer(questionId: questionId, examId: examId, answer: answer);

    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        Fluttertoast.showToast(msg: 'done');
      } else {
        Fluttertoast.showToast(msg: 'error');
      }
    }
  }

  setPause() async {
    ResponsModel responsModel =
        await WebServices().setPause(examId: examId, questionId: questionId);

    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        Fluttertoast.showToast(msg: 'done');
      } else {
        Fluttertoast.showToast(msg: 'error');
      }
    }
  }

  Future setBookmark({@required String note}) async {
    ResponsModel responsModel = await WebServices().setBookmark(
      questionId: questionId,
      note: note,
    );
    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        Fluttertoast.showToast(msg: 'done');
      } else {
        Fluttertoast.showToast(msg: 'error');
      }
    }
  }

  setSaveFeedback({@required String note}) async {
    ResponsModel responsModel =
        await WebServices().setSaveFeedback(questionId: questionId, note: note);

    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        Fluttertoast.showToast(msg: 'done');
      } else {
        Fluttertoast.showToast(msg: 'error');
      }
    }
  }

  getLabValue() async {
    ResponsModel responsModel = await WebServices().getLabValue();

    if (responsModel.success) {
      if (responsModel.data.body['IsSuccess']) {
        Fluttertoast.showToast(msg: 'done');
      } else {
        Fluttertoast.showToast(msg: 'error');
      }
    }


  }

}
