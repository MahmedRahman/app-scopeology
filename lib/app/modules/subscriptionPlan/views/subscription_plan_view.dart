import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/ListAnimator.dart';
import 'package:scopeology/app/data/component.dart';
import 'package:scopeology/app/modules/subscriptionPay/views/subscription_pay_view.dart';
import 'package:scopeology/app/routes/app_pages.dart';

import '../controllers/subscription_plan_controller.dart';

class SubscriptionPlanView extends GetView<SubscriptionPlanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defualtAppBar(title: 'Subscription Plan'),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: controller.getCategory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListAnimator(
                    children: List.generate(
                      snapshot.data.length,
                      (index) => CardSubscribe(
                        cardColor: Color(0xff125E51),
                        price: '${snapshot.data[index]['Price']} SR',
                        title: '${snapshot.data[index]['Name']} Subscribe',
                        onTap: () {
                          Get.to(
                              SubscriptionPayView(
                                data: snapshot.data[index],
                              ),
                              fullscreenDialog: true);
                        },
                      ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }

  Widget CardSubscribe(
          {@required Color cardColor,
          @required String title,
          @required String price,
          @required Function onTap}) =>
      InkWell(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    iconBadge(
                      picture: 'images/subscription.svg',
                      color: cardColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 20,
                    color: cardColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultbnt(
                  text: 'Subscribe Now',
                  bntColor: cardColor,
                )
              ],
            ),
          ),
        ),
      );
}
