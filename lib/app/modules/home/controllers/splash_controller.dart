import 'dart:async';

import 'package:cash_vic/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import '../../../widgets/data_store.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print(token().toString() + 'manoj');
    gotopage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  gotopage() {
    return Future.delayed(
        Duration(seconds: 3),
        () => token() == ''
            ? Get.offAndToNamed('/intro')
            : Get.offAll(HomeView()));
  }
}
