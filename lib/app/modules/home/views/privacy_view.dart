import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/privacy_controller.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PrivacyView extends GetView<PrivacyController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PrivacyController());
    return Scaffold(
        appBar: Myappbar(name: 'Privacy Policy'),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                heightSpace20,
                Container(
                  // width: Get.width * 0.90,
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.2,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.Overview.value = true;
                        },
                        child: Container(
                          width: Get.width * 0.45,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.Overview.value
                                  ? AppColors.greycolor4
                                  : Color(0xffF6F6F6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Text(
                            'Human-Friendly',
                            style: TextStyle(
                                color: controller.Overview.value
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.Overview.value = false;
                        },
                        child: Container(
                          width: Get.width * 0.45,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: !controller.Overview.value
                                  ? AppColors.greycolor4
                                  : Color(0xffF6F6F6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Text(
                            'Overview',
                            style: TextStyle(
                                color: !controller.Overview.value
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                heightSpace20,
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
        ));
  }
}
