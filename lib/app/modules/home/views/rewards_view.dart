import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/models/coin_transaction.dart';
import 'package:cash_vic/app/modules/home/controllers/rewards_controller.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RewardsView extends GetView<RewardsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RewardsController());
    return Scaffold(
        appBar: Myappbar(image: IntroImages.cash_vic, name: 'Rewards'),
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
                    // Text(
                    //   'Current Balance',
                    //   style: BaseStyles.black20,
                    // ),
                    // heightSpace10,
                    Text(
                      "${controller.points.value} Coins",
                      style: BaseStyles.black25,
                    ),
                    // Text(
                    //   controller.getTime(),
                    //   style: BaseStyles.black13,
                    // ),
                    Text(
                      """\nIn your rewards, your money is shown as COINS to you where 1 Coin is equal to 1 paisa.
                    For Example: 1 Coin= 1 Paisa
                    100 Coins= INR 1
                    1000 Coins= INR 10
                    \nYou can raise your withdrawal  request on the completion of 20000 Coins, that’s, INR 200.
                      """,
                      style: BaseStyles.grey12,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 45,
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                                color: AppColors.greycolor.withOpacity(0.1),
                                offset: Offset(0, 2)),
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.secondary2Color),
                      child: MaterialButton(
                        onPressed: () async {
                          String amount = "";
                          await Get.bottomSheet(
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 50,
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        splashRadius: 20,
                                      ),
                                      Text(
                                        'Redeem Points here',
                                        style: BaseStyles.black20,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      )
                                    ],
                                  ),
                                ),
                                heightSpace10,
                                Text(
                                  "Minimum 20000 coins required",
                                  style: BaseStyles.secondaryb15,
                                ),
                                heightSpace5,
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    height: 50,
                                    width: Get.width * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColors.greycolor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          amount = value;
                                        },
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter Amount',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                heightSpace10,
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            blurRadius: 1.0,
                                            spreadRadius: 1.0,
                                            color: AppColors.greycolor
                                                .withOpacity(0.1),
                                            offset: Offset(0, 2)),
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.secondary2Color),
                                  child: Obx(() => MaterialButton(
                                        onPressed: () async {
                                          if (amount == "") {
                                            Get.snackbar(
                                              "Error",
                                              "Please enter amount",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              icon: Icon(
                                                Icons.error,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Colors.red,
                                            );
                                          } else if (int.parse(amount) <
                                              20000) {
                                            Get.snackbar(
                                              "Error",
                                              "Minimum 20000 coins required",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              icon: Icon(
                                                Icons.error,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Colors.red,
                                            );
                                          } else if (int.parse(amount) >
                                              controller.points.value) {
                                            Get.snackbar(
                                              "Error",
                                              "Insufficient coins",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              icon: Icon(
                                                Icons.error,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Colors.red,
                                            );
                                          } else {
                                            final res =
                                                await controller.redeem(amount);
                                          }
                                        },
                                        child: controller.isLoading.value
                                            ? CircularProgressIndicator()
                                            : Text(
                                                "Redeem",
                                                style: BaseStyles.whitebold20,
                                              ),
                                      )),
                                ),
                                heightSpace30,
                              ],
                            ),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                          );
                        },
                        child: Text(
                          "Redeem",
                          style: BaseStyles.whitebold20,
                        ),
                      ),
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
                  ? ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      shrinkWrap: true,
                      itemCount: controller.transactions.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        CoinTransaction transaction =
                            controller.transactions[index];
                        return Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(transaction.remarks ?? "",
                                          style: BaseStyles.black13),
                                      Text("Transaction id : ${transaction.id}",
                                          style: BaseStyles.black13),
                                      Text(
                                          DateFormat('h:mm a dd-MMMM yyyy')
                                              .format(transaction.time),
                                          style: BaseStyles.secondary12),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${transaction.points} Coins",
                                  style: BaseStyles.blackbold15,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Container()
            ],
          ),
        ));
  }
}
