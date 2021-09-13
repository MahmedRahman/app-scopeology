import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:scopeology/api/api_manger.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/app/data/app_constand.dart';

class WebServices extends APIManger {
  Future<Response> siginWithEmail({
    @required String email,
    @required String password,
  }) async {
    EasyLoading.show(status: 'loading');

    var data = {
      "username": email,
      "password": password,
      "grant_type": "password"
    };
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    Response response = await post('https://scopeology.com/token', formData,
        headers: <String, String>{
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        });
    if (response.status.hasError) {
      EasyLoading.showError(response.body['error_description']);
      return Future.error(response.body['error_description']);
    } else {
      EasyLoading.showSuccess('Done');
      return response;
    }
  }

  Future<ResponsModel> getProfile() async {
    ResponsModel response = await repGet('Account/GetProfile');
    return response;
  }

  Future<ResponsModel> getExam() async {
    ResponsModel response = await repGet('Exam/Get');
    return response;
  }

  Future<ResponsModel> getBookmark() async {
    ResponsModel response = await repGet('Exam/GetBookmark');
    return response;
  }

  Future<ResponsModel> getCategory() async {
    ResponsModel response = await repGet('Category/Get/${KCategoryId.value}');
    return response;
  }

  Future<ResponsModel> getPromoCode({
    @required promoCode,
    @required packageId,
  }) async {
    ResponsModel response = await repPost(
        'Payment/PromoCode?packageId=$packageId&code=$promoCode', {});
    return response;
  }

  Future<ResponsModel> setSubscribe({
    @required promoCode,
    @required packageId,
  }) async {
    ResponsModel response = await repPost(
        'Package/Subscribe?id=$packageId&promoCode=$promoCode', {});
    return response;
  }

  Future<ResponsModel> startDemoExam() async {
    ResponsModel response = await repPost('Exam/StartDemoExam', {});
    return response;
  }

  Future<ResponsModel> getExamDetailes({@required String examId}) async {
    ResponsModel response = await repGet('Exam/Get/$examId', showLoading: true);
    return response;
  }

  Future<ResponsModel> getLabValue() async {
    ResponsModel response = await repGet('LabValue/Get', showLoading: true);
    return response;
  }

  Future<ResponsModel> getCourse() async {
    ResponsModel response = await repGet('Course/Get', showLoading: true);
    return response;
  }

  

  Future<ResponsModel> setExamFlage({@required String questionId}) async {
    ResponsModel response =
        await repPost('Exam/SetFlage/?id=$questionId', {}, showLoading: true);
    return response;
  }

  Future<ResponsModel> setSaveFeedback({
    @required String questionId,
    @required String note,
  }) async {
    ResponsModel response = await repPost(
        'Exam/SaveFeedback/?id=$questionId&note=$note', {},
        showLoading: true);
    return response;
  }

  Future<ResponsModel> setAnswer({
    @required String questionId,
    @required String examId,
    @required String answer,
  }) async {
    ResponsModel response = await repGet(
        'Exam/SetAnswer/?id=$questionId&answer=$answer&examId=$examId',
        showLoading: true);
    return response;
  }

  Future<ResponsModel> setBookmark({
    @required String questionId,
    @required String note,
  }) async {
    ResponsModel response = await repPost(
      'Exam/SetBookmark/?id=$questionId&note=$note',
      {},
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> setPause({
    @required String examId,
    @required String questionId,
  }) async {
    ResponsModel response = await repPost(
      'Exam/SetPause/?id=$examId&lastAnswered=$questionId',
      {},
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> setFinish({
    @required String examId,
  }) async {
    ResponsModel response = await repPost(
      'Exam/SetFinish/?id=$examId',
      {},
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> setFeedback({
    @required Name,
    @required Body,
    PhoneNumber,
  }) async {
    ResponsModel response = await repPost('Home/Feedback', {
      "Name": Name,
      "PhoneNumber": PhoneNumber,
      "Email": "sample string 4",
      "Subject": "sample string 5",
      "Body": Body
    });
    return response;
  }







  Future<ResponsModel> RegisterAccount({
    @required Name,
    @required FirstName,
    @required LastName,
    @required CategoryId,
    @required Hospital,
    @required GraduationYear,
    @required Email,
    @required PhoneNumber,
    @required UserName,
    @required SCFHS,
    @required Gender,
    @required Password
  }) async {
    ResponsModel response = await repPost('Account/Register', {
      "Name": Name,
      "FirstName":FirstName,
      "LastName": LastName,
      "CategoryId": CategoryId,
      "Hospital": Hospital,
      "GraduationYear": GraduationYear,
      "Email": Email,
      "PhoneNumber": PhoneNumber,
      "UserName": UserName,
      "SCFHS": SCFHS,
      "Gender": Gender,
          "Password":Password,
    "ConfirmPassword":Password
    });
    return response;
  }
}
