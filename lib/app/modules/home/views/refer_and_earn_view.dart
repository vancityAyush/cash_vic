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
              popupmenu(context, 0.obs);
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
              """\nWith our Refer & Earn Program you can earn the unlimited rewards with just a single click..

Just copy the code shown above and send it to all your family, Friends and Group.
""",
              textAlign: TextAlign.center,
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
              "Every new user( to Cash Vic App) who gets registered on Cash Vic App by using your referral code will make you earn INR 4( 400 Coins). For Example, if  10 of your known uses your code and Register with the Cash Vic App, you earn INR 40( 40000 Coins)",
              style: BaseStyles.grey12,
            ),
          ],
        ),
      ),
      // heightSpace20
      // ],
    );
  }
}
