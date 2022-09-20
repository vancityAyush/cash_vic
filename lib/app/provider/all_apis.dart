import 'dart:io';

import 'package:get/get.dart';

import '../baseurl.dart';

class ApisProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> fetchContests() async {
    try {
      var response = await httpClient.get('/fetch_all_contests');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> redeemPoints(String userId, String amount) async {
    try {
      var response = await httpClient.get('/reward_redeem/$userId/$amount');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> rewardPoints(String userId) async {
    try {
      var response = await httpClient.get('/reward_points/$userId');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getProbWin(String userId, String type) async {
    try {
      var response = await httpClient.get('/prob_winn/$userId/$type');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getSpinnerItems() async {
    try {
      var response = await httpClient.get('/fetch_spinner_items');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> withdraw(
      {required String userId,
      required String amount,
      required String remarks}) async {
    httpClient.baseUrl = BASE_URL;

    final form = FormData({
      'user_id': userId,
      "amount": amount,
      "remarks": remarks,
    });
    var res = await post('create_withdraw_request', form, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> fetchTrackList(
      {required String userId, required String offerId}) async {
    httpClient.baseUrl = BASE_URL;

    final form = FormData({
      'user_id': userId,
      'offer_id': offerId,
    });
    var res = await post('track_list_fetch', form, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> updateTrackList(
      {required String userId, required String offerId}) async {
    httpClient.baseUrl = BASE_URL;

    final form = FormData({
      'user_id': userId,
      'offer_id': offerId,
    });
    var res = await post('track_list_add', form, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> profileP(key) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('fetch_profile', key, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> UpdateP(data) async {
    httpClient.baseUrl = BASE_URL;
    File file = new File(data['image']);
    Map<String, dynamic> formData = Map<String, dynamic>.from(data);

    formData.addAll({
      'image': data['image'] == ''
          ? null
          : MultipartFile(file, filename: data['image']),
      'key': data['key'],
      'first_name': data['first_name'],
      'aadhaar_number': data['aadhaar_number'],
      'pan_number': data['pan_number'],
      'state': data['state'],
      'gender': data['gender'],
      'age': data['age'],
    });
    final form = FormData(formData);
    var res = await post('edit_profile', form, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> addBank(
      {required String userId,
      required String bankName,
      required String ifscCode,
      required String accountNumber,
      required String accountName,
      String? bankId = null}) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post(
      '/insert_bank${bankId == null ? '' : '/$bankId'}',
      FormData({
        'user_id': userId,
        'bank_name': bankName,
        'ifsc_code': ifscCode,
        'account_number': accountNumber,
        'account_name': accountName,
      }),
      headers: {
        "Accept": "application/json",
      },
    );
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> fetchWallet(data) async {
    httpClient.baseUrl = BASE_URL;
    Map<String, dynamic> formData = {};

    formData.addAll({
      'key': data,
    });
    final form = FormData(formData);
    var res = await post('fetch_wallet', form, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> fetchBanks(String userId) async {
    httpClient.baseUrl = BASE_URL;

    final form = FormData({
      'user_id': userId,
    });
    var res = await post('fetch_bank', form, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  //--------- DAILY SPIN------------------
  Future<dynamic> fetchDailySpin() async {
    try {
      var response = await httpClient.get('/daily_spins');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  //--------- Probable Winner ------------------

  Future<dynamic> fetchProbableWinner() async {
    try {
      var response = await httpClient.get('/probable_winner');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  //--------- Daily Spin Done ------------------

  Future<dynamic> fetchDailySpinDone(String userId) async {
    httpClient.baseUrl = BASE_URL;

    final form = FormData({
      'user_id': userId,
    });
    var res = await post('daily_spin_done', form, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  //--------- Daily Winner Election Value ------------------

  Future<dynamic> probableWinnerSelection(
      {required String userId,
      required String winningId,
      required String amount}) async {
    httpClient.baseUrl = BASE_URL;

    final form = FormData({
      'user_id': userId,
      'winning_id': winningId,
      'amount': amount,
    });
    var res = await post('probable_winner_selection_value', form, headers: {
      "Accept": "application/json",
    });
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      print(res.statusText);
      return Future.error('Network Problem');
    }
  }
}
