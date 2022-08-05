import 'package:cash_vic/app/services/ApiService.dart';
import 'package:get/get.dart';

import '../../../models/transaction.dart';
import '../../../widgets/data_store.dart';

class WalletController extends GetxController {
  //TODO: Implement WalletController

  final count = 0.obs;
  final all = true.obs;

  final apiService = Get.find<ApiService>();
  final transactions = RxList<Transaction>();

  FetchWallet() async {
    final res = await apiService.apiManager.fetchWallet(token());
    print(res);
    final d = res['data'];
    for (var item in d) {
      transactions.add(Transaction.fromJson(item));
    }
    print(transactions);
  }

  @override
  void onInit() {
    super.onInit();
    FetchWallet();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
