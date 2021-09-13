import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scopeology/api/response_model.dart';
import 'package:scopeology/api/web_serives.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  TextEditingController FirstName;
  TextEditingController LastName;
  TextEditingController Gender;

  TextEditingController Category;
  TextEditingController Hospital;
  TextEditingController GeaduationYear;

  TextEditingController Email;
  TextEditingController Password;
  TextEditingController PhoneNumber;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    FirstName = new TextEditingController();
    LastName = new TextEditingController();
    Gender = new TextEditingController();

    Category = new TextEditingController();
    Hospital = new TextEditingController();
    GeaduationYear = new TextEditingController();

    Email = new TextEditingController();
    Password = new TextEditingController();
    PhoneNumber = new TextEditingController();
  }

  registerAccount() async {
    ResponsModel responsModel = await WebServices().RegisterAccount(
        Name: '${FirstName.text} ${LastName.text}',
        FirstName: FirstName.text,
        LastName: LastName.text,
        CategoryId: '1',
        Hospital: Hospital.text,
        GraduationYear: GeaduationYear.text,
        Email: Email.text,
        PhoneNumber: PhoneNumber.text,
        UserName: Email.text,
        SCFHS: '',
        Gender: Gender.text,
        Password: Password.text);
    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['IsSuccess']) {
        Fluttertoast.showToast(msg: 'msg');
      } else {
        Fluttertoast.showToast(msg: response.body['Message']);
      }

      return response.body;
    }
  }
}
