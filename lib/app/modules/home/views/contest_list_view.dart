import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/contest_list_controller.dart';
import 'package:cash_vic/app/widgets/popupmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'offers_view.dart';

class ContestListView extends GetView<ContestListController> {
  ContestCategory category;
  ContestListView({required this.category});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ContestListController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.blackcolor,
                )),
            widthSpace10,
            Text(
              controller.categoryMap[category] ?? "Others",
              style: BaseStyles.blackbold15,
            )
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                popupmenu(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/home_images/Down.png',
                      height: 23,
                      color: AppColors.blackcolor,
                    ),
                    Text(
                      'Filter',
                      style: BaseStyles.blackbold15,
                    ),
                  ],
                ),
              ))
        ],
      ),
      body: Obx(
        () => Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: AppColors.whitecolor,
            borderRadius: BorderRadius.circular(5),
            border: Border(
              top: BorderSide(color: AppColors.greycolor.withOpacity(0.5)),
              left: BorderSide(color: AppColors.greycolor.withOpacity(0.5)),
              right: BorderSide(color: AppColors.greycolor.withOpacity(0.5)),
              bottom: BorderSide(color: AppColors.greycolor.withOpacity(0.5)),
            ),
          ),
          child: controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.contestList.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return controller.contestList[index].contestCategory ==
                            category
                        ? Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(OffersView(
                                    data: controller.contestList[index],
                                  ));
                                },
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(top: 5),
                                  // width: Get.width * 0.80,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.greycolor
                                              .withOpacity(0.3)),
                                    ),
                                    color: Color.fromRGBO(255, 234, 172, 0.38),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            // color: Colors.white,
                                            border: Border.all(
                                                color: AppColors.greycolor
                                                    .withOpacity(0.5)),
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.asset(
                                              controller
                                                  .contestList[index].image,
                                              height: 35,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // widthSpace5,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(0),
                                            width: Get.width * 0.50,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                heightSpace5,
                                                Text(
                                                    controller
                                                        .contestList[index]
                                                        .name,
                                                    style: BaseStyles.black16),
                                                heightSpace5,
                                                // Text(
                                                //     controller.contestList[index]
                                                //         .offer_terms,
                                                //     style: BaseStyles.black15),
                                              ],
                                            ),
                                          ),
                                          heightSpace5,
                                          // Expanded(
                                          //   child: Container(
                                          //     // height: 25,
                                          //     width: Get.width,
                                          //     // margin: E,
                                          //     color: Color.fromRGBO(255, 234, 172, 0.82),
                                          //     child:
                                          //     // child: Align(
                                          //     //   alignment: Alignment.bottomCenter,
                                          //     //   child: Container(
                                          //     //       width: Get.width * 0.25,
                                          //     //       padding:
                                          //     //           const EdgeInsets.only(top: 5),
                                          //     //       child: getitem(
                                          //     //           name: 'Get 17',
                                          //     //           action: () =>
                                          //     //               Get.to(OffersView()))),
                                          //     // ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Container(
                                          width: Get.width * 0.20,
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: getitem(
                                            name:
                                                'Get ${controller.contestList[index].price}',
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              // heightSpace5,
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              //   child: Divider(
                              //     color: AppColors.greycolor,
                              //   ),
                              // ),
                            ],
                          )
                        : Container();
                  },
                ),
        ),
      ),
      // heightSpace20
      // ],
    );
  }

  getitem({required name}) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 100,
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
      child: Text(
        name,
        style: BaseStyles.black13,
      ),
    );
  }
}
