import 'package:cash_vic/app/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final imageList = [
    IntroImages.videos,
    IntroImages.marketing,
    IntroImages.coins,
    IntroImages.refer,
  ];
  final data = [].obs;
  var load = false;

  final imageurl = IntroImages.videos.obs;
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);
  }

  image(index) {
    imageurl.value = imageList[index];
  }

  @override
  void dispose() {
    super.dispose();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values); // to re-show bars
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
  }
}
