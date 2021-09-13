import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scopeology/app/data/app_constand.dart';
import 'package:scopeology/app/routes/app_pages.dart';

Widget defaultbnt2({@required String text, Function onPressed}) => SizedBox(
      width: Get.width,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: KSecondaryColor,
          side: BorderSide(color: Color(0xffD4AF38), width: 1),
        ),
        child: Text(
          text,
          style:
              TextStyle(color: Color(0xffD4AF38), fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget defaultbnt({
  @required String text,
  Function onPressed,
  var bntColor = KbntColor,
}) =>
    SizedBox(
      width: Get.width,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(bntColor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget defaultTextFormField({
  String hintText,
  bool obscureText = false,
  Function validator,
  TextInputType keyboardType = TextInputType.text,
  @required TextEditingController controller,
}) =>
    TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultText({
  TextAlign textAlign = TextAlign.center,
  @required String text,
  Function onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: SizedBox(
        width: Get.width,
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
          textAlign: textAlign,
        ),
      ),
    );

Widget defaultLogo() => Image.asset('images/logo.png');

Widget defaultbottomSheet(
        {String svgPicture,
        @required String text,
        @required Function onPressed,
        @required String elevatedButtonText}) =>
    Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SvgPicture.asset(svgPicture),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xffD4AF38),
                    ),
                  ),
                  child: Text(
                    elevatedButtonText,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));

Widget iconBadge({
  @required String picture,
  Color color = KprimaryColor,
}) =>
    Container(
      width: 64,
      height: 64,
      color: color.withOpacity(.2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          picture,
          color: color,
        ),
      ),
    );

Widget defualtAppBar({
  @required String title,
}) =>
    AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      elevation: 0,
    );
