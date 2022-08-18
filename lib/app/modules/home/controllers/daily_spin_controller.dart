import 'dart:math';

import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/models/spin_data.dart';
import 'package:cash_vic/app/widgets/data_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../../services/ApiService.dart';

class DailySpinController extends GetxController {
  RxList<SpinData> items = RxList<SpinData>();
  RxList<int> winningItems = RxList<int>();

  Color getColor(SpinData item) {
    return AppColors.spinnerColors[items.indexOf(item)];
  }

  RxBool isLoading = RxBool(true);
  final selected = BehaviorSubject<int>();
  final apiService = Get.find<ApiService>();

  @override
  void onInit() {
    super.onInit();
    fetchData();
    // otpController = TextEditingController(text: currentText.value.toString());
  }

  void fetchData() async {
    await apiService.fetchDailySpin().then((value) {
      items.value = value ?? [];
    });
    await apiService.fetchProbableWinner().then((value) {
      winningItems.value = value ?? [];
    });
    isLoading.value = false;
  }

  void startSpinner() async {
    bool isDone = await apiService.fetchDailySpinDone(userID());
    if (false) {
      Get.defaultDialog(
        title: 'Spin Done',
        content: Text('You have already spun today\nPlease try again tomorrow'),
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    } else {
      int ran = Random().nextInt(winningItems.value.length);
      int index = winningItems.value[ran];
      selected.add(index - 1);
    }
  }

  void stopSpinner() async {
    SpinData won = items.value[selected.value];
    bool isWin = !won.spin_values.toLowerCase().contains("better");
    await apiService.apiManager.probableWinnerSelection(
        userId: userID(),
        winningId: won.id,
        amount: isWin ? won.spin_values : "0");
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      title: isWin ? 'Congratulations' : "You Lost!",
      content: Text(
        isWin ? 'You won $won' : won.toString(),
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
