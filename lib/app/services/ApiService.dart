import 'package:cash_vic/app/models/contest.dart';
import 'package:cash_vic/app/models/spin_data.dart';
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

  Future<bool> fetchTrackList(
      {required String userId, required String offerId}) async {
    // error_code = 1 for not showing
    // error_code = 0 for showing start button
    try {
      var response =
          await apiManager.fetchTrackList(userId: userId, offerId: offerId);
      return response["error_code"] == 1;
    } catch (e) {
      print(e.toString());
    }
    return false;
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

  Future<List<SpinData>?> fetchDailySpin() async {
    try {
      var response = await apiManager.fetchDailySpin();
      var d = response['data'];
      List<SpinData> contest = [];
      for (var item in d) {
        contest.add(SpinData.fromJson(item));
      }
      return contest;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<bool> fetchDailySpinDone(String userId) async {
    try {
      var response = await apiManager.fetchDailySpinDone(userId);
      var d = response['data'];
      //d null when spin is done
      // d==null is true when spin is done
      return d == null;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<List<int>?> fetchProbableWinner() async {
    try {
      var response = await apiManager.fetchProbableWinner();
      var d = response['data'][0]['winner_id'];
      String s = d.toString();
      s = s.substring(1, s.length - 1);
      List<int> items = [];
      for (var i in s.split(',')) {
        items.add(int.parse(i));
      }
      return items;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
