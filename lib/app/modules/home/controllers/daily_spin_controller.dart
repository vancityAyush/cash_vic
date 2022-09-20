import 'package:cash_vic/app/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../../services/ApiService.dart';

class DailySpinController extends GetxController {
  RxList<int> items = RxList<int>();
  RxList<int> winningItems = RxList<int>();

  Color getColor(int item) {
    return AppColors
        .spinnerColors[items.indexOf(item) % (AppColors.spinnerColors.length)];
  }

  RxBool isLoading = RxBool(true);
  final selected = BehaviorSubject<int>();
  final apiService = Get.find<ApiService>();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading.value = true;
    await apiService.getSpinnerItems().then((value) {
      items.value = value;
      isLoading.value = false;
    });
    isLoading.value = false;
  }

  void startSpinner() async {
    print("spinner started");
    var res = await apiService.getProbWin();
    print(res);
    if (res['data'] == null) {
      Get.showSnackbar(
        GetBar(
          message: res['response_string'],
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      int ran = res['data'];
      int index = items.indexOf(ran);
      selected.add(index);
    }
  }

  void stopSpinner() async {
    int won = items.value[selected.value];
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      title: 'Congratulations!!',
      content: Text(
        'You won $won',
        style: BaseStyles.blackbold15,
      ),
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
