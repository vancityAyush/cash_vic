import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/bank_controller.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddbankdetailsView extends GetView<BankController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BankController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.whitecolor,
                )),
            widthSpace10,
            Text(
              'Add Bank Details',
              style: BaseStyles.whiteBold18,
            )
          ],
        ),
      ),
      backgroundColor: AppColors.secondaryColor,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 15.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whitecolor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          HomeImages.cancel,
                          height: 30,
                        )),
                    Image.asset(
                      HomeImages.gover,
                      height: 60,
                    ),
                    heightSpace20,
                    Text('Add Your Bank Account',
                        style: BaseStyles.secondary20),
                    heightSpace5,
                    Text(
                        'Adding Bank Details is  madatory for processing withdrals.',
                        style: BaseStyles.grey13),
                    heightSpace20,
                    Container(
                      height: 40,
                      padding: EdgeInsets.all(8),
                      decoration: decorationbox(),
                      child: DropdownButton<String>(
                        // elevation: 0,
                        // underline: ,
                        underline: SizedBox(),
                        isDense: true,
                        isExpanded: true,
                        hint: Text(
                          'Bank',
                          style: BaseStyles.grey13,
                        ),
                        // Initial Value
                        // value: dropdownvalue,
                        value: controller.bankName,
                        // Down Arrow Icon
                        // icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: controller.bank.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (newValue) {
                          controller.setBankName(newValue!);
                        },
                      ),
                    ),
                    heightSpace20,
                    Text('Account Number*', style: BaseStyles.grey15),
                    heightSpace5,
                    Container(
                      height: 40,
                      width: Get.width * 0.85,
                      decoration: decorationbox(),
                      child: TextField(
                        onChanged: (value) {
                          controller.setAccountNumber(value);
                        },
                        // controller: controller.mobileTextEditingController,
                        // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: AppColors.secondaryColor),
                        decoration: InputDecoration(
                          hintStyle: BaseStyles.grey14,
                          isDense: true,
                          contentPadding: EdgeInsets.all(15),
                          // prefixIcon: Padding(
                          //     padding: EdgeInsets.all(12),
                          //     child: Image.asset(
                          //       IntroImages.mesg,
                          //     )),
                          // prefixStyle: BaseStyles.mainMedium14,
                          // hintText: 'E-mail or Phone Number ',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    heightSpace20,
                    Text('IFSC*', style: BaseStyles.grey15),
                    heightSpace5,
                    Container(
                      height: 40,
                      width: Get.width * 0.85,
                      decoration: decorationbox(),
                      child: TextField(
                        onChanged: (value) {
                          controller.setIfsc(value);
                        },
                        // controller: controller.mobileTextEditingController,
                        // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: AppColors.secondaryColor),
                        decoration: InputDecoration(
                          hintStyle: BaseStyles.grey14,
                          isDense: true,
                          contentPadding: EdgeInsets.all(15),
                          // prefixIcon: Padding(
                          //     padding: EdgeInsets.all(12),
                          //     child: Image.asset(
                          //       IntroImages.mesg,
                          //     )),
                          // prefixStyle: BaseStyles.mainMedium14,
                          // hintText: 'E-mail or Phone Number ',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    heightSpace20,
                    Text('Account Holder Name*', style: BaseStyles.grey15),
                    heightSpace5,
                    Container(
                      height: 40,
                      width: Get.width * 0.85,
                      decoration: decorationbox(),
                      child: TextField(
                        onChanged: (value) {
                          controller.setAccountName(value);
                        },
                        // controller: controller.mobileTextEditingController,
                        // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: AppColors.secondaryColor),
                        decoration: InputDecoration(
                          hintStyle: BaseStyles.grey14,
                          isDense: true,
                          contentPadding: EdgeInsets.all(15),
                          // prefixIcon: Padding(
                          //     padding: EdgeInsets.all(12),
                          //     child: Image.asset(
                          //       IntroImages.mesg,
                          //     )),
                          // prefixStyle: BaseStyles.mainMedium14,
                          // hintText: 'E-mail or Phone Number ',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    heightSpace50,
                    Container(
                        child: GestureDetector(
                      onTap: () async {
                        controller.saveBank();
                        // Get.to(HomeView());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: Get.width * 0.88,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          WelcomeStrings.next,
                          style: BaseStyles.whiteBold18,
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Container(
      //     child: GestureDetector(
      //   onTap: () {
      //     // Get.to(HomeView());
      //   },
      //   child: Container(
      //     alignment: Alignment.center,
      //     height: 40,
      //     width: Get.width * 0.88,
      //     decoration: BoxDecoration(
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.grey.withOpacity(0.5),
      //             spreadRadius: 0.2,
      //             blurRadius: 3,
      //             offset: Offset(0, 2), // changes position of shadow
      //           ),
      //         ],
      //         color: AppColors.secondaryColor,
      //         borderRadius: BorderRadius.circular(5)),
      //     child: Text(
      //       WelcomeStrings.next,
      //       style: BaseStyles.whiteBold18,
      //     ),
      //   ),
      // )),
    );
  }
}
