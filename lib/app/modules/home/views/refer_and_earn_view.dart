import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/widgets/popupmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/myprofile_controller.dart';

class ReferAndEarnView extends GetView<MyprofileController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyprofileController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.blackcolor,
                )),
            widthSpace10,
            Text(
              "Refer & Earn",
              style: BaseStyles.blackbold15,
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              popupmenu(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/home_images/Down.png',
                    height: 23,
                    color: AppColors.blackcolor,
                  ),
                  Text(
                    'Filter',
                    style: BaseStyles.blackbold15,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              HomeImages.refer,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            heightSpace10,
            Text(
              "Refer & Earn",
              style: BaseStyles.blackbold18,
            ),
            heightSpace5,
            Text(
              "Tap on the box to copy referral code",
              style: BaseStyles.blackbold15,
            ),
            heightSpace30,
            Obx(
              () => Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MaterialButton(
                  onPressed: () {
                    controller.copyRef();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50,
                  ),
                  child: Text(
                    controller.refercode.value,
                    style: BaseStyles.black15,
                  ),
                ),
              ),
            ),
            heightSpace30,
            CircleAvatar(
              radius: 25,
              child: IconButton(
                icon: Icon(
                  Icons.share,
                  size: 25,
                ),
                onPressed: () {
                  controller.share();
                },
              ),
            ),
            heightSpace30,
            Text(
              "Share your referral code with your friends and earn extra cash",
              style: BaseStyles.blackbold15,
            ),
          ],
        ),
      ),
      // heightSpace20
      // ],
    );
  }
}
