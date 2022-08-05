import 'package:cash_vic/app/constants/app_basestyles.dart';
import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TermconditionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappbar(name: 'Terms & Conditions'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Condition of Use',
              style: BaseStyles.blackbold15,
            ),
            heightSpace10,
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8),
              decoration: decorationbox(color: Color(0xffF6F6F6)),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.',
                style: BaseStyles.grey15,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              child: GestureDetector(
            onTap: () {
              // Get.to(HomeView());
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: Get.width * 0.43,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'ACCEPT',
                style: BaseStyles.whiteBold15,
              ),
            ),
          )),
          Container(
              child: GestureDetector(
            onTap: () {
              // Get.to(HomeView());
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: Get.width * 0.43,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'DECLINE',
                style: BaseStyles.greybold15,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
