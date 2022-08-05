import 'package:cash_vic/app/constants/strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SplashController());
    controller.gotopage();
    return Scaffold(
        body: Center(
      child: Image.asset(IntroImages.cash_vic),
    ));
  }
}
