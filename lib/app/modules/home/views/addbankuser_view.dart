import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/models/bank.dart';
import 'package:cash_vic/app/modules/home/controllers/bank_controller.dart';
import 'package:cash_vic/app/modules/home/views/addbankdetails_view.dart';
import 'package:cash_vic/app/modules/home/views/edit_bankdetails_view.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddbankuserView extends GetView<BankController> {
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
        body: Column(
          children: [
            Container(
              height: 60,
              width: Get.width,
              color: AppColors.secondaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.to(AddbankdetailsView());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.all(10),
                    decoration: decorationbox(),
                    height: 40,
                    width: Get.width * 0.80,
                    child: Text(
                      '+Add Bank',
                      style: BaseStyles.grey16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.banksAccountList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Bank currentBank = controller.banksAccountList[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: decorationbox(),
                        child: ListTile(
                          isThreeLine: true,
                          leading: Image.asset(
                            HomeImages.gover,
                            height: 40,
                          ),
                          title: Text(
                            currentBank.header,
                            style: BaseStyles.blackbold18,
                          ),
                          subtitle: Text(currentBank.subtitle,
                              style: BaseStyles.grey16),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.secondaryColor,
                            ),
                            onPressed: () {
                              Get.to(
                                EditBankDetailsView(
                                  bank: currentBank,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                      // return Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     padding: const EdgeInsets.all(5),
                      //     decoration: decorationbox(),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Image.asset(
                      //               HomeImages.gover,
                      //               height: 40,
                      //             ),
                      //             widthSpace5,
                      //             Text(
                      //               currentBank.bank_name +
                      //                   '\t' +
                      //                   currentBank.account_number,
                      //               style: BaseStyles.blackbold15,
                      //             ),
                      //             widthSpace20,
                      //             Image.asset(HomeImages.vector)
                      //           ],
                      //         ),
                      //         SizedBox(
                      //           width: Get.width * 0.68,
                      //           child: Text(
                      //             currentBank.ifsc_code,
                      //             style: BaseStyles.grey11,
                      //           ),
                      //         ),
                      //         heightSpace20
                      //       ],
                      //     ),
                      //   ),
                      // );
                    }),
              ),
            ),
          ],
        ));
  }
}
