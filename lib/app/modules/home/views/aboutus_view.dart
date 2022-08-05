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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.',
                  style: BaseStyles.grey15,
                ),
                heightSpace10,
              ],
            ),
          ),
        ));
  }
}
