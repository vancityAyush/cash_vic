import 'dart:io';

import 'package:cash_vic/app/modules/home/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../provider/auth.dart';
import '../../../widgets/please_wait.dart';
import '../../../widgets/toast.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final count = 0.obs;
  final selectedstate = ''.obs;
  final selectedgender = ''.obs;
  final selectedage = ''.obs;
  // final refercode = 'CASH VIC 5560'.obs;
  var state = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh	',
    'Uttarakhand',
    'West Bengal'
  ].obs;
  final agelist = [
    "10-20",
    "20-30",
    "30-40",
    "40-50",
    "50-60",
    "60-70",
    "70-80",
    "80-90",
    "90-100"
  ].obs;
  XFile? pickedFile;

  var selectedImagepath = ''.obs;
  var selectedImageSize = ''.obs;
  final pickFileLoading = false.obs;
  final isfilepicked = false.obs;
  var fileName = ''.obs;

  TextEditingController nametxt = TextEditingController();

  TextEditingController refertxt = TextEditingController();
  TextEditingController emailtxt = TextEditingController();
  TextEditingController mobiletxt = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  imagecontroller(ImageSource imageSource) async {
    pickedFile = (await ImagePicker().pickImage(source: imageSource))!;
    print(pickedFile.toString() + "manoj");
    if (pickedFile != '') {
      selectedImagepath.value = pickedFile!.path;
      pickFileLoading.value = true;
      isfilepicked.value = true;
      fileName.value = pickedFile!.path.split('/').last;
    } else {
      showToast('Please Select File');
      // pickedFile;
    }
  }

  signupc() async {
    String name = nametxt.text;
    String mobile = mobiletxt.text;
    // String image = form.toString();
    String email = emailtxt.text;
    String state = selectedstate.value;
    String gender = selectedgender.value;
    String age = selectedage.value;
    String refer = refertxt.text;

    if (name == '') {
      showToast('fill your name');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      showToast('Please enter a valid email address');
    } else if (mobile == '') {
      showToast('Please fill your Number');
    } else if (state == '') {
      showToast('Please select your state');
    } else if (gender == '') {
      showToast('fill your Gender');
    } else if (age == '') {
      showToast('fill your age');
    } else if (refer == '') {
      showToast('Copy refer code');
    } else {
      pleaseWait();
      try {
        var form = {
          'name': name,
          'email': email,
          'phone': mobile,
          'state': state,
          'gender': gender,
          'age': age,
          'refer_code': refer,
          'image': pickedFile == null ? '' : pickedFile!.path.toString(),
        };

        // print(pickedFile!.path.toString());

        print(form);
        var res = await AuthProvider().SignupP(form);
        print(res);
        if (res['error_code'] == 1) {
          showToast('Register has been successfully');
          Get.offAll(() => LoginView());
        } else {
          showToast('User Already exists');
        }
      } catch (e) {
        showToast(e.toString());
        print(e.toString());
      }
      Get.back();
    }
  }
}
