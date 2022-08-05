import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FeqView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Myappbar(name: 'Frequently Asked Questions'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently Asked Questions',
                style: BaseStyles.blackbold15,
              ),
              heightSpace20,
              Container(
                width: Get.width,
                // height: Get.height,
                padding: EdgeInsets.all(8.0),
                decoration: decorationbox(color: Color(0xffF6F6F6)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/home_images/Minus.png'),
                    widthSpace5,
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.',
                        style: BaseStyles.grey15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
