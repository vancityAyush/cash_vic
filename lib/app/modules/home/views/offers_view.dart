import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/offers_controller.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/contest.dart';

class OffersView extends GetView<OffersController> {
  final Contest data;
  OffersView({required this.data});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OffersController());
    controller.putContest(data);
    return Scaffold(
        appBar: Myappbar(
          name: data.name,
          image: 1,
          color: AppColors.secondaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(8),
                  decoration: decorationbox(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/home_images/Minus.png'),
                      widthSpace5,
                      Expanded(
                        child: Text(
                          'if you wish  to claim the reward, Kindly complete the brand task with all steps mentioned below.',
                          style: BaseStyles.grey13,
                        ),
                      ),
                    ],
                  ),
                ),
                heightSpace10,
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: decorationbox(),
                            child: Obx(
                              () => Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30,
                                        alignment: Alignment.center,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.whitecolor,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          index.toString(),
                                          style: BaseStyles.secondary12,
                                        ),
                                      ),
                                      Container(
                                        width: Get.width * 0.40,
                                        child: Text(
                                          controller.events[index].event_name,
                                          style: BaseStyles.grey12,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.showStartButton(index);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xffECE7E7)
                                                  .withOpacity(0.5)),
                                          child: Text(
                                            controller.events[index].price,
                                            style: BaseStyles.black12bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  heightSpace10,
                                  controller.list[index]
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                2,
                                                (index) => Container(
                                                  padding: EdgeInsets.all(4),
                                                  child: Text(
                                                    '${index}.Register on bullspree & Easily avail full body checkup at home and regular health check up.',
                                                    style:
                                                        BaseStyles.greybold11,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            heightSpace10,
                                            Text(
                                              'Note: Registration is Mandatory',
                                              style: BaseStyles.greybold11,
                                            ),
                                            heightSpace10,
                                            GestureDetector(
                                              onTap: () {
                                                controller.start(index);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: Get.width * 0.88,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 0.2,
                                                        blurRadius: 3,
                                                        offset: Offset(0,
                                                            2), // changes position of shadow
                                                      ),
                                                    ],
                                                    color: AppColors
                                                        .secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  'Start Now',
                                                  style: BaseStyles.whiteBold18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  heightSpace10,
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                controller.show.value == false
                    ? Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(2),
                        color: AppColors.secondaryColor,
                        child: Text(
                          'NOTE: This offer is for users who have never user this  product before.',
                          style: BaseStyles.black12bold,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
                // heightSpace30
              ],
            ),
          ),
        ));
  }
}
