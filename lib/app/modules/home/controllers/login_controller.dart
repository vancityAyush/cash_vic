import 'package:cash_vic/app/widgets/data_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../provider/auth.dart';
import '../../../widgets/please_wait.dart';
import '../../../widgets/toast.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController mobiletxt = TextEditingController();
  TextEditingController otpController = TextEditingController();
  var box = GetStorage();
  final show = 0.obs;
  final currentText = ''.obs;
  @override
  void onInit() {
    super.onInit();

    // otpController = TextEditingController(text: currentText.value.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loginc() async {
    String mobile = mobiletxt.text;
    if (mobile == '') {
      showToast('Please fill your Number');
    } else {
      pleaseWait();
      try {
        Map imagepath = {"username": mobile};
        Map<String, dynamic> formData = Map<String, dynamic>.from(imagepath);
        formData.addAll({
          'username': mobile,
        });
        final form = FormData(formData);

        print(form);
        var res = await AuthProvider().loginP(form);
        print(res);
        if (res['error_code'] == 1) {
          showToast('Otp send Successfully');

          box.write('otp', res['data'].toString());
          currentText.value = res['data'].toString();
          box.write('username', mobile);
          otpController.text = res['data'].toString();
          show.value = 1;
        } else {
          showToast('Number and Email Not register');
        }
      } catch (e) {
        showToast(e.toString());
      }
      Get.back();
    }
  }

  otpc() async {
    String otp = otpController.text;
    print(otp);
    if (otp == '') {
      showToast('Please fill your Otp');
    } else {
      pleaseWait();
      try {
        Map imagepath = {"username": otp};
        Map<String, dynamic> formData = Map<String, dynamic>.from(imagepath);
        formData.addAll({'username': mobiletxt.text, 'otp': Save_Otp()});
        final form = FormData(formData);

        print(form);
        var res = await AuthProvider().otpP(form);
        print(res);
        if (res['error_code'] == 1) {
          // showToast('Otp send Successfully');
          box.write('key', res['data'].toString());
          print(box.read('key'));

          Get.offAll(() => HomeView());
          mobiletxt.text = '';
          otpController.text = '';
        } else {
          showToast('Number and Email Not register');
        }
      } catch (e) {
        showToast(e.toString());
      }
      Get.back();
    }
  }
}
