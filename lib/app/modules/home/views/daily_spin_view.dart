import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/daily_spin_controller.dart';
import 'package:cash_vic/app/widgets/popupmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

class DailySpinView extends GetView<DailySpinController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DailySpinController());
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
              "Daily Spin",
              style: BaseStyles.blackbold15,
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              popupmenu(context, 0.obs);
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
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/home_images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            heightSpace30,
            Text(
              "Spin Daily and Win Rewards",
              style: BaseStyles.whitebold20,
            ),
            Spacer(),
            Obx(() => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF021E39),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FortuneWheel(
                      indicators: [
                        FortuneIndicator(
                          child: Image.asset(
                            'assets/home_images/indicator.png',
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        FortuneIndicator(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                          ),
                        ),
                      ],
                      animateFirst: false,
                      selected: controller.selected.stream,
                      onAnimationEnd: () {
                        controller.stopSpinner();
                      },
                      items: controller.items
                          .map(
                            (element) => FortuneItem(
                              child: Container(
                                margin: const EdgeInsets.all(18.0),
                                child: Text(
                                  element.toString(),
                                ),
                              ),
                              style: FortuneItemStyle(
                                borderWidth: 3,
                                textStyle: element.toString().length < 4
                                    ? BaseStyles.whitebold25
                                    : BaseStyles.white12,
                                textAlign: TextAlign.end,
                                borderColor: Color(0xFF021E39),
                                color: controller.getColor(element),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
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
                onPressed: () {
                  controller.startSpinner();
                },
                child: Text(
                  "Spin",
                  style: BaseStyles.whitebold20,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      // heightSpace20
      // ],
    );
  }
}
