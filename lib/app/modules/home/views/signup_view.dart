import 'dart:io';
import 'dart:ui';

import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/signup_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupController());
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // heightSpace20,
                      Text(
                        SignUpStrings.sign,
                        style: BaseStyles.blackbold24,
                      ),
                      heightSpace10,
                      Text(
                        SignUpStrings.self,
                        style: BaseStyles.black13,
                      ),
                      heightSpace20,
                      // heightSpace30,
                      textfileds(
                          w: Get.width * 0.65,
                          name: 'Name',
                          controller: controller.nametxt),
                      textfileds(
                          w: Get.width * 0.65,
                          name: 'E-mail',
                          controller: controller.emailtxt),
                      textfileds(
                          w: Get.width,
                          name: 'Mobile Number',
                          controller: controller.mobiletxt,
                          show: true),

                      DropdownButton(
                        isExpanded: true,
                        hint: Text(
                          'State',
                          style: BaseStyles.grey13,
                        ),
                        // Initial Value
                        value: controller.selectedstate.isNotEmpty
                            ? controller.selectedstate.value
                            : null,

                        // Down Arrow Icon
                        // icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: controller.state.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          controller.selectedstate.value = newValue ?? '';
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            SignUpStrings.gender,
                            style: BaseStyles.black13,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10),
                            child: Row(
                              children: [
                                gender(
                                    name: SignUpStrings.male,
                                    image: SignImages.male,
                                    action: () {
                                      controller.selectedgender.value =
                                          SignUpStrings.male;
                                    }),
                                widthSpace30,
                                widthSpace20,
                                gender(
                                    name: SignUpStrings.female,
                                    image: SignImages.female,
                                    action: () => controller.selectedgender
                                        .value = SignUpStrings.female),
                              ],
                            ),
                          )
                        ],
                      ),
                      heightSpace20,
                      Text(
                        SignUpStrings.age,
                        style: BaseStyles.black13,
                      ),
                      heightSpace10,
                      SizedBox(
                        height: 35,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.agelist.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.selectedage.value =
                                          controller.agelist[index];
                                    },
                                    child: Obx(
                                      () => Container(
                                        alignment: Alignment.center,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: controller
                                                        .selectedage.value ==
                                                    controller.agelist[index]
                                                ? AppColors.secondaryColor
                                                : AppColors.whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                color: controller.selectedage
                                                            .value ==
                                                        controller
                                                            .agelist[index]
                                                    ? AppColors.secondaryColor
                                                    : AppColors.greycolor)),
                                        child: Text(
                                          '${controller.agelist[index].toString()}',
                                          style: controller.selectedage.value ==
                                                  controller.agelist[index]
                                              ? BaseStyles.whiteBold13
                                              : BaseStyles.grey13,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                      heightSpace20,
                      Text(
                        SignUpStrings.refercode,
                        style: BaseStyles.black13,
                      ),
                      heightSpace10,
                      DottedBorder(
                          color: AppColors.secondaryColor,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(8),
                          padding: EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              // margin: EdgeInsets.all(5),
                              height: 35,
                              width: Get.width * 0.90,
                              color: Color(0xffFFF9E0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    textfiled2(
                                        controller: controller.refertxt,
                                        name: 'Refer Code '),
                                    // textfileds(
                                    //     w: Get.width * 0.30,
                                    //     name: 'Refer Code ',
                                    //     controller: controller.refertxt,
                                    //     show: true),
                                    Text(
                                      'Tap to copy',
                                      style: BaseStyles.black13,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      heightSpace20,
                      Text(SignUpStrings.apply,
                          style: TextStyle(
                              color: Color(0xff4325FD),
                              fontSize: 13,
                              fontWeight: FontWeight.w500)),
                      // heightSpace50,
                      heightSpace20,
                      Container(
                          child: GestureDetector(
                        onTap: () {
                          controller.signupc();
                          // Get.to(LoginView());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 44,
                          width: Get.width * 0.88,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            WelcomeStrings.next,
                            style: BaseStyles.whiteBold18,
                          ),
                        ),
                      )),
                      heightSpace10,
                    ]),
              ),
              Obx(
                () => Positioned(
                    right: 5,
                    top: 80,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              controller.imagecontroller(ImageSource.gallery),
                          //  Get.to(
                          //   ImageScreenView(),
                          // ),
                          child: controller.isfilepicked.value == false
                              ? CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage: AssetImage(
                                    SignImages.carmera,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(
                                      File(controller.selectedImagepath.value)),
                                  radius: 40.0,
                                ),
                        ),
                        heightSpace10,
                        Text(
                          SignUpStrings.upload,
                          style: BaseStyles.secondarydark11Color,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  gender({required name, required image, action}) {
    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: action,
            child: Container(
              height: 35,
              width: 35,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondaryColor),
                  shape: BoxShape.circle,
                  color: controller.selectedgender.value == name
                      ? AppColors.secondaryColor
                      : AppColors.whitecolor),
              child: Image.asset(image),
            ),
          ),
          heightSpace5,
          Text(
            name,
            style: BaseStyles.black13,
          )
        ],
      ),
    );
  }

  Container textfileds({required w, required name, required controller, show}) {
    return Container(
      width: w,
      child: TextField(
        inputFormatters: [
          show == true
              ? LengthLimitingTextInputFormatter(10)
              : LengthLimitingTextInputFormatter(50)
        ],
        keyboardType: show == true ? TextInputType.number : TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          // labelText: 'Name',
          hintText: name,
          hintStyle: BaseStyles.grey13,
          // errorText: _errorText,
          // Enabled Border
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          // Focused Border
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
          ),

          // Error Border
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
          ),
          // Focused Error Border
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
          ),
        ),
      ),
    );
  }

  textfiled2({controller, name}) {
    return Container(
      width: Get.width * 0.60,
      // height: 50,
      // alignment: Alignment.center,
      child: TextField(
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        keyboardType: TextInputType.text,
        controller: controller,
        style: BaseStyles.secondaryb15,
        // expands: true,

        decoration: InputDecoration(
          // labelText: 'Name',

          hintText: name,
          hintStyle: BaseStyles.grey13,
          // errorText: _errorText,
          // Enabled Border
          border: InputBorder.none,

          // Focused Border
        ),
      ),
    );
  }
}
