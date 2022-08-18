import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import '../../../provider/all_apis.dart';
import '../../../widgets/data_store.dart';
import '../../../widgets/please_wait.dart';
import '../../../widgets/toast.dart';
import '../views/home_view.dart';
import 'home_controller.dart';

class MyprofileController extends GetxController {
  //TODO: Implement MyprofileController

  final count = 0.obs;
  final selectedstate = ''.obs;
  final selectedgender = ''.obs;
  final selectedage = ''.obs;
  final refercode = ''.obs;
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
  var data = Get.find<HomeController>().drawerdata;

  TextEditingController nametxt = TextEditingController();

  TextEditingController emailtxt = TextEditingController();
  TextEditingController mobiletxt = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    print(token());
    emailtxt = TextEditingController(text: data['email']);
    mobiletxt = TextEditingController(text: data['phone']);
    nametxt = TextEditingController(text: data['name']);
    selectedstate.value = data['state'] ?? '';
    selectedage.value = data['age'].toString();
    selectedgender.value = data['gender'].toString();
    selectedImagepath.value = data['image'].toString();
    refercode.value = data['referal_code'].toString();
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

  void copyRef() {
    FlutterClipboard.copy(refercode.value)
        .then((value) => {showToast('Referral Code Copied to clipboard')});
  }

  void share() {
    Share.share(
        'Check out Cashvic App\n Signup with my referral code ${refercode.value} and earn upto Rs.100 for every friend who joins the app',
        subject: "Cashvic");
  }

  updatec() async {
    String name = nametxt.text;
    String mobile = mobiletxt.text;
    // String image = form.toString();
    String email = emailtxt.text;
    String state = selectedstate.value;
    String gender = selectedgender.value;
    String age = selectedage.value;

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
    } else {
      pleaseWait();
      try {
        var data = {
          'key': token(),
          'first_name': name,
          'aadhaar_number': email,
          'pan_number': mobile,
          'state': state,
          'gender': gender,
          'age': age,
          'image': pickedFile == null ? '' : pickedFile!.path.toString(),
        };

        // print(form);

        var res = await ApisProvider().UpdateP(data);
        print(res);
        if (res['error_code'] == 1) {
          showToast('Profile has been Updated');
          Get.offAll(() => HomeView());
        } else {
          showToast('Profile already updated');
        }
      } catch (e) {
        showToast(e.toString());
        print(e.toString());
      }
      Get.back();
    }
  }
}
