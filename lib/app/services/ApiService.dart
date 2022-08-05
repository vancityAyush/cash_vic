import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../provider/all_apis.dart';

/**
 * Created by : Ayush Kumar
 * Created on : 06-08-2022
 */
class ApiService extends GetxService {
  final ApisProvider apiManager = ApisProvider();
  Future<ApiService> init() async {
    apiManager.onInit();
    return this;
  }
}
