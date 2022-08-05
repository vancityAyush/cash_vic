import 'package:cash_vic/app/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modules/home/views/introductionscreen_view.dart';

signout(controller) {
  return Get.defaultDialog(
    titleStyle: BaseStyles.black18,
    title: DrawerDetails.logout,
    middleText: 'Do you really want to Log out',
    cancel: cancleBtn(),
    confirm: confirmBtn(
      action: () {
        var box = GetStorage();
        box.remove('key');
        Get.offAll(IntroductionView());
        // controller.logoutC();
      },
      label: DrawerDetails.logout,
    ),
  );
}

confirmBtn({required action, required label}) {
  return GestureDetector(
    onTap: action,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(label, style: BaseStyles.whiteBold13),
    ),
  );
}

cancleBtn() {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.greycolor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        'Cancel',
        style: BaseStyles.whiteBold13,
      ),
    ),
  );
}
