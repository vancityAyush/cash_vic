import 'package:cash_vic/app/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Myappbar({image, name, color}) {
  return AppBar(
    elevation: 0,
    backgroundColor: color == null ? Colors.white : color,
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
        name == null
            ? Container()
            : Text(
                name,
                style: BaseStyles.blackbold15,
              )
      ],
    ),
    actions: [
      image == 1
          ? Container()
          : image == null
              ? Image.asset(
                  IntroImages.cash_vic,
                  // height: 30,
                  width: 100,
                )
              : Image.asset(
                  image,
                  height: 40,
                  width: 100,
                ),
    ],
  );
}
