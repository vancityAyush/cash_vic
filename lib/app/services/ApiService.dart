import 'package:cash_vic/app/models/contest.dart';
import 'package:cash_vic/app/models/spin_data.dart';
import 'package:cash_vic/app/widgets/data_store.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
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

  Future<dynamic> getProbWin() async {
    try {
      var profile = await getProfileData();
      DateTime createdDate = DateTime.parse(profile['data']["created_at"]);
      String type = "";
      if (createdDate.difference(DateTime.now()) < Duration(days: 15)) {
        type = "First";
      } else {
        type = "Regular";
      }
      var response = await apiManager.getProbWin(userID(), type);
      return response;
    } catch (e) {
      print(e.toString());
    }
    return "0";
  }

  Future<List<int>> getSpinnerItems() async {
    try {
      var res = await getProfileData();
      DateTime createdDate = DateTime.parse(res['data']["created_at"]);
      var response = await apiManager.getSpinnerItems();
      if (createdDate.difference(DateTime.now()) < Duration(days: 15)) {
        final list = List<int>.from(response["for_first"]);
        return list;
      } else {
        final list = List<int>.from(response["for_regular"]);
        return list;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  getProfileData() async {
    try {
      Map imagepath = {"key": token()};
      Map<String, dynamic> formData = Map<String, dynamic>.from(imagepath);
      final form = FormData(formData);

      print(form);
      var res = await apiManager.profileP(form);
      return res;
    } catch (e) {
      print(e);
    }
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
