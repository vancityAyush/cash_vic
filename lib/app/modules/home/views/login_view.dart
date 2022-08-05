import 'dart:ui';

import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/widgets/data_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/login_controller.dart';
import 'home_view.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.blackcolor,
            )),
      ),
      body: Obx(
        () => Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(children: [
                // heightSpace20,
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      WelcomeStrings.login,
                      style: BaseStyles.blackbold24,
                    ),
                  ),
                ),
                heightSpace30,
                heightSpace30,
                Align(
                  child: Image.asset(
                    IntroImages.person,
                    height: 70,
                  ),
                ),
                heightSpace50,
                heightSpace30,
                Align(
                  child: Container(
                    height: 44,
                    width: Get.width * 0.85,
                    decoration: BoxDecoration(
                        color: AppColors.whitecolor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.2,
                            blurRadius: 3,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: controller.mobiletxt,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).primaryColor,
                      style: BaseStyles.black16,
                      decoration: InputDecoration(
                        hintStyle: BaseStyles.grey14,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        prefixIcon: Padding(
                            padding: EdgeInsets.all(12),
                            child: Image.asset(
                              IntroImages.mesg,
                            )),
                        // prefixStyle: BaseStyles.mainMedium14,
                        hintText: 'E-mail or Phone Number ',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                heightSpace20,
                Container(
                  height: 62,
                  width: Get.width * 0.90,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: PinCodeTextField(
                      readOnly: true, autoDisposeControllers: true,
                      appContext: context,
                      enablePinAutofill: true,
                      autoDismissKeyboard: true,

                      pastedTextStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: (v) {
                        return null;
                        // if (v.length < 5) {
                        //   return 'Invalid Pin';
                        // } else {
                        //   return null;
                        // }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(50),
                        // fieldHeight: 40,
                        // fieldWidth: 50,
                        activeColor: AppColors.secondaryColor,
                        inactiveColor: AppColors.greycolor,
                        inactiveFillColor: AppColors.whitecolor,
                        activeFillColor: AppColors.whitecolor,
                        selectedFillColor: AppColors.whitecolor,
                      ),
                      cursorColor: AppColors.secondaryColor,
                      animationDuration: Duration(milliseconds: 300),
                      textStyle: TextStyle(
                          fontSize: 20,
                          height: 1.6,
                          color: AppColors.blackcolor),
                      enableActiveFill: true,
                      controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.grey.withAlpha(10),
                          // blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print('Completed');
                      },
                      // onTap: () {
                      //   print('Pressed');
                      // },
                      onChanged: (value) {
                        print(value);
                        controller.currentText.value = value;
                      },
                      beforeTextPaste: (text) {
                        print('Allowing to paste $text');
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                ),
                heightSpace10,
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      WelcomeStrings.remember,
                      style: BaseStyles.grey14,
                    ),
                    widthSpace10,
                    Container(
                      margin: EdgeInsets.only(right: 18),
                      child: FlutterSwitch(
                        width: 25.0, activeColor: AppColors.secondaryColor,
                        height: 15.0,
                        valueFontSize: 15.0,
                        toggleSize: 9.0,
                        value: true,
                        borderRadius: 30.0,
                        // padding: 2.0,
                        // showOnOff: true,
                        onToggle: (val) {
                          // setState(() {
                          //   status = val;
                          // });
                        },
                      ),
                    ),
                  ],
                ),
                heightSpace50,
                heightSpace20,
                controller.show.value == 0
                    ? Container(
                        child: GestureDetector(
                        onTap: () {
                          // Get.to(HomeView());
                          controller.loginc();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: Get.width * 0.88,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            WelcomeStrings.next,
                            style: BaseStyles.whiteBold18,
                          ),
                        ),
                      ))
                    : Container(
                        child: GestureDetector(
                        onTap: () {
                          // Get.to(HomeView());
                          controller.otpc();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: Get.width * 0.88,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            WelcomeStrings.otp,
                            style: BaseStyles.whiteBold18,
                          ),
                        ),
                      )),
                heightSpace10,
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      WelcomeStrings.forgot,
                      style: BaseStyles.grey14,
                    ),
                  ),
                )
              ]),
            )),
      ),
    );
  }
}
