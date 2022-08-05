import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/views/signup_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'login_view.dart';

class WelcomeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Image.asset(
              IntroImages.cash_vic,
              height: 70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    WelcomeStrings.title1,
                    style: BaseStyles.black18,
                  ),
                  heightSpace5,
                  Text(
                    WelcomeStrings.title2,
                    style: BaseStyles.grey412,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(LoginView());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 44,
                    width: Get.width * 0.85,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      WelcomeStrings.login,
                      style: BaseStyles.whiteBold18,
                    ),
                  ),
                ),
                heightSpace20,
                GestureDetector(
                  onTap: () {
                    Get.to(SignupView());
                  },
                  child: Text(
                    WelcomeStrings.signup,
                    style: BaseStyles.blackbold18,
                  ),
                ),
                heightSpace20,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: WelcomeStrings.bysiging,
                        style: BaseStyles.black11),
                    TextSpan(
                        text: WelcomeStrings.term,
                        style: BaseStyles.secondaryColor11,
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            // Get.toNamed('/signup');
                          }),
                  ])),
                ),
                heightSpace20
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
