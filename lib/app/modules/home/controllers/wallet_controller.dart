import 'package:cash_vic/app/services/ApiService.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/transaction.dart';
import '../../../widgets/data_store.dart';

class WalletController extends GetxController {
  //TODO: Implement WalletController

  final currentbalance = 0.0.obs;
  final all = true.obs;

  final apiService = Get.find<ApiService>();
  final transactions = RxList<Transaction>();

  Future<double> FetchWallet() async {
    final res = await apiService.apiManager.fetchWallet(token());
    print(res);
    final d = res['data'];
    for (var item in d) {
      transactions.add(Transaction.fromJson(item));
      final balance = double.parse(item['amount']);
      currentbalance.value += balance;
    }
    return currentbalance.value;
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
    FetchWallet();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
