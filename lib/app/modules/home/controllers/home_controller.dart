import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/models/contest.dart';
import 'package:cash_vic/app/modules/home/controllers/wallet_controller.dart';
import 'package:cash_vic/app/services/ApiService.dart';
import 'package:cash_vic/app/widgets/data_store.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../widgets/toast.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final apiService = Get.find<ApiService>();
  final sliderCurrentIndex = 0.obs;
  final selectedtab = 0.obs;
  final drawerdata = {}.obs;
  final contestdata = <Contest>[].obs;
  RxDouble currentBalance = 0.0.obs;
  late final WalletController walletController = WalletController();
  final data = [
    {"name": "Daily Spin", "images": HomeImages.game},
    {"name": "Invite & Earn", "images": HomeImages.roulette},
    {"name": "Games", "images": HomeImages.games},
    {"name": "Exclusive Shop", "images": HomeImages.business},
    // {"name": "Puzzie Games", "images": HomeImages.flag},
    // {"name": "Best Games", "images": HomeImages.invite},
    // {"name": "Fun games", "images": HomeImages.game2},
    // {"name": "Other.", "images": HomeImages.ellipse},
  ].obs;
  @override
  void onInit() {
    super.onInit();
    Profilec();
    FetchContest();
    walletController.FetchWallet().then((value) {
      currentBalance.value = value;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  FetchContest() async {
    try {
      final response = await apiService.fetchContest();
      print(response);
      contestdata.addAll(response ?? []);
      print(contestdata);
    } catch (e) {
      showToast(e.toString());
    }
  }

  Profilec() async {
    try {
      Map imagepath = {"key": token()};
      Map<String, dynamic> formData = Map<String, dynamic>.from(imagepath);
      formData.addAll({
        'key': token().toString(),
      });
      final form = FormData(formData);

      print(form);
      var res = await apiService.apiManager.profileP(form);
      print(res);
      GetStorage().write('userID', res['data']['id']);
      drawerdata.addAll(res['data']);
    } catch (e) {
      showToast(e.toString());
    }
    Get.back();
  }
}
