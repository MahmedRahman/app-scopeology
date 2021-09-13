import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scopeology/app/data/component.dart';

import '../controllers/subscription_pay_controller.dart';

class SubscriptionPayView extends GetView<SubscriptionPayController> {
  SubscriptionPayController controller = Get.put(SubscriptionPayController());
  var data;
  SubscriptionPayView({@required this.data});
  @override
  Widget build(BuildContext context) {
    controller.price.value = data['Price'].toString();
    print(data);
    return Scaffold(
        appBar: defualtAppBar(title: 'Subscription Coupon'),
        body: Obx(() {
          return Container(
            child: CardSubscribe(
                cardColor: Color(0xff125E51),
                price: '${data['Price']} SR',
                title: '${data['Name']} Subscribe',
                discount: '${controller.price.value} SR',
                onTap: () {
                  FocusScope.of(context).unfocus();
                  controller.setSubscribe();
                },
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.getPromoCode();
                }),
          );
        }));
  }

  Widget CardSubscribe(
          {@required Color cardColor,
          @required String title,
          @required String price,
          @required String discount,
          Function onTap,
          Function onPressed}) =>
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
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 20,
                          color: cardColor,
                          fontWeight: FontWeight.bold,
                          decoration: discount == price
                              ? TextDecoration.none
                              : TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    discount == price
                        ? Container()
                        : Text(
                            discount,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.promoCode,
                  decoration: InputDecoration(
                    hintText: 'Promo code',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.done),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultbnt(
                  text: 'Pay Now',
                  bntColor: cardColor,
                )
              ],
            ),
          ),
        ),
      );
}
