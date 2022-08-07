import 'package:cash_vic/app/models/contest.dart';
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

  Future<List<Contest>?> fetchContest() async {
    try {
      var response = await apiManager.fetchContests();
      var d = response['data'];
      List<Contest> contest = [];
      for (var item in d) {
        contest.add(Contest.fromJson(item));
      }
      return contest;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
