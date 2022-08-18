import 'dart:io';

import 'package:get/get.dart';

import '../baseurl.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> SignupP(data) async {
    File file = new File(data['image']);
    Map<String, dynamic> formData = Map<String, dynamic>.from(data);

    formData.addAll({
      'image': data['image'] == ''
          ? null
          : MultipartFile(file, filename: data['image']),
      'name': data['name'],
      'email': data['email'],
      'phone': data['phone'],
      'state': data['state'],
      'gender': data['gender'],
      'age': data['age'],
      'used_refereal': data['used_refereal'],
    });
    final form = FormData(formData);
    httpClient.baseUrl = BASE_URL;
    var res = await post('register_user', form, headers: {
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

  Future<dynamic> loginP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('set_verify_otp', data, headers: {
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

  Future<dynamic> otpP(data) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post('verify_otp', data, headers: {
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
