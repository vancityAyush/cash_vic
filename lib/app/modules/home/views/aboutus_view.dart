import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutusView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Myappbar(name: 'About Us'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: Get.width,
            // height: Get.height,
            padding: EdgeInsets.all(8.0),
            decoration: decorationbox(color: Color(0xffF6F6F6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace10,
                Text(
                  'Who We Are',
                  style: BaseStyles.blackbold20,
                ),
                heightSpace20,
                Text(
                  'Bringing opportunity to earn CASH to our VIC’s (Very Important Customer) is what CashVic about. CashVic, is an application designed in such a simplified platform that connects all of our users with brands, allow them to experience Brand’s Product/Services and the same time EARN money with no limitation. With CashVic, you get an opportunity to make your second Income even if you are student, not working anywhere or want a earn from home money. Try our app, earn money and keep earning!!',
                  style: BaseStyles.grey15,
                ),
                heightSpace10,
              ],
            ),
          ),
        ));
  }
}
