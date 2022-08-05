import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/models/transaction.dart';
import 'package:cash_vic/app/modules/home/controllers/wallet_controller.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WalletView extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WalletController());
    return Scaffold(
        appBar: Myappbar(image: IntroImages.cash_vic, name: 'Wallet'),
        body: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Money Sent',
                      style: BaseStyles.black20,
                    ),
                    heightSpace10,
                    Text(
                      '10,000',
                      style: BaseStyles.black25,
                    ),
                    Text(
                      '12 March 2020,11:13 PM',
                      style: BaseStyles.black13,
                    ),
                    Divider()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                // width: Get.width * 0.90,
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.all.value = true;
                      },
                      child: Container(
                        width: Get.width * 0.48,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.all.value
                                ? Get.theme.primaryColor
                                : Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Text(
                          'All',
                          style: TextStyle(
                              color: controller.all.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.all.value = false;
                      },
                      child: Container(
                        width: Get.width * 0.48,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: !controller.all.value
                                ? Get.theme.primaryColor
                                : Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Text(
                          'Paid',
                          style: TextStyle(
                              color: !controller.all.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              heightSpace10,
              Container(
                height: 50,
                padding: EdgeInsets.all(15),
                // alignment: Alignment.bottomLeft,
                width: Get.width,
                color: AppColors.secondaryColor,
                child: Text(
                  DateFormat('MMMM yyyy').format(DateTime.now()),
                  // textAlign: TextAlign.left,
                  style: BaseStyles.black18,
                ),
              ),
              controller.all.value == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.transactions.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        Transaction transaction =
                            controller.transactions[index];
                        return Column(
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/home_images/a23.png',
                                        height: 60,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(transaction.remarks,
                                              style: BaseStyles.black13),
                                          Text(
                                              "Transaction id : ${transaction.id}",
                                              style: BaseStyles.black13),
                                          Text(
                                              DateFormat('h:mm a dd-MMMM yyyy')
                                                  .format(transaction.time),
                                              style: BaseStyles.secondary12)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      transaction.value,
                                      style: BaseStyles.black13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        );
                      },
                    )
                  : Container()
            ],
          ),
        ));
  }
}
