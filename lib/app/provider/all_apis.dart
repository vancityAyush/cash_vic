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
}
