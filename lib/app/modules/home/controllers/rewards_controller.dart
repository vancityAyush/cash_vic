import 'package:cash_vic/app/models/coin_transaction.dart';
import 'package:cash_vic/app/services/ApiService.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/data_store.dart';

class RewardsController extends GetxController {
  //TODO: Implement RewardsController

  final points = 0.obs;
  final all = true.obs;

  RxBool isLoading = false.obs;
  final apiService = Get.find<ApiService>();
  final transactions = RxList<CoinTransaction>();

  Future<void> FetchRewards() async {
    final res = await apiService.apiManager.rewardPoints(userID());
    print(res);
    points.value = int.parse(res["data1"]["points"]);
    final d = res['data'];
    for (var item in d) {
      transactions.add(CoinTransaction.fromJson(item));
    }
    print('transactions fetched');
  }

  Future<void> redeem(String amount) async {
    isLoading.value = true;
    final res = await apiService.apiManager.redeemPoints(userID(), amount);
    print(res);
    isLoading.value = false;
    Get.back();
    // final res = await apiService.apiManager
    //     .withdraw(userId: userID(), amount: amount, remarks: remark);
    // isLoading.value = false;
    // if (res['response_string'] == 'OK')
    //   return true;
    // else {
    //   return false;
    // }
  }

  String getTime() {
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMMM yyyy, hh:mm a');
    String formatted = formatter.format(now);
    return formatted;
  }

  @override
  void onInit() {
    super.onInit();
    FetchRewards();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
