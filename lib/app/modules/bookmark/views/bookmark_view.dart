import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/ListAnimator.dart';
import 'package:scopeology/app/data/app_constand.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  BookmarkController controller = Get.put(BookmarkController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: controller.getBookmark(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListAnimator(
                children: List.generate(
                  snapshot.data.length,
                  (index) => bookMarkCard(
                    Note: snapshot.data[index]['Note']
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget bookMarkCard({@required Note}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(
                    Note,
                    style: TextStyle(
                      fontSize: 14,
                    )),
                leading: Container(
                  height: Get.height,
                  width: 64,
                  color: KprimaryColor.withOpacity(.5),
                  child: SizedBox(child: Icon(Icons.bookmark)),
                ),
              ),
            ),
          ),
        ),
      );
}
