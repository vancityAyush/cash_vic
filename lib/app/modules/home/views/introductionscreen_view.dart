import 'dart:ui';

import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/introductionscreen_controller.dart';
import 'package:cash_vic/app/modules/home/views/welcome_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionView extends GetView<IntroductionController> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => IntroductionController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(controller.imageurl.value),
                    fit: BoxFit.cover)),
            child: IntroductionScreen(
                key: introKey,
                dotsFlex: 2,
                globalBackgroundColor: AppColors.whitecolor,
                onChange: (value) {
                  controller.image(value);
                  print(controller.imageurl);
                },
                pages: [
                  // PageViewModel(
                  //   title: 'FXKUBER',
                  //   body: 'Motivation to move.',
                  // ),

                  pageModel(
                      body:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      title: 'How To Use',
                      image: IntroImages.videos),
                  pageModel(
                      body:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      title: 'Refer & Earn',
                      image: IntroImages.refer),
                  pageModel(
                      title: 'Daily Spain',
                      body:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      image: IntroImages.refer),
                  pageModel(
                      title: 'Bulk Share',
                      body:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      image: IntroImages.marketing),
                ],
                //  [

                onDone: () => _onIntroEnd(context),
                onSkip: () =>
                    _onIntroEnd(context), // You can override onSkip callback
                showSkipButton: true,
                nextFlex: 0,
                //rtl: true, // Display as right-to-left
                skip: Text(''),
                next: Text(''),
                done: Text(
                  'Next',
                  style: BaseStyles.secondaryColor12,
                ),
                curve: Curves.fastLinearToSlowEaseIn,
                controlsMargin: const EdgeInsets.all(16),
                controlsPadding: kIsWeb
                    ? const EdgeInsets.all(12.0)
                    : const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 30.0),
                dotsDecorator: const DotsDecorator(
                  size: Size(10.0, 10.0),
                  color: Color(0xFFBDBDBD),
                  activeColor: Colors.orange,
                  activeSize: Size(10.0, 10.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
                dotsContainerDecorator: const ShapeDecoration(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                )),
          ),
        ));
  }

  PageViewModel pageModel({required body, required title, required image}) {
    return PageViewModel(
        bodyWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            body,
            style: BaseStyles.grey12,
            textAlign: TextAlign.center,
          ),
        ),
        titleWidget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 200,
            ),
            SizedBox(height: Get.height * 0.30),
            Container(
              height: 44,
              width: 278,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondaryColor),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                title,
                style: BaseStyles.secondaryColor12,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        decoration: PageDecoration(
            bodyAlignment: Alignment.center, titlePadding: EdgeInsets.all(10)));
  }

  void _onIntroEnd(context) {
    Get.offAll(() => WelcomeView());
    IntroductionController().dispose();
  }
}
