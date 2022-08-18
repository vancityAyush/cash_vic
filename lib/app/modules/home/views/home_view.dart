import 'package:carousel_slider/carousel_slider.dart';
import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/views/daily_spin_view.dart';
import 'package:cash_vic/app/modules/home/views/gamecategories_view.dart';
import 'package:cash_vic/app/modules/home/views/offers_view.dart';
import 'package:cash_vic/app/modules/home/views/refer_and_earn_view.dart';
import 'package:cash_vic/app/modules/home/views/shopcategories_view.dart';
import 'package:cash_vic/app/modules/home/views/wallet_view.dart';
import 'package:cash_vic/app/widgets/mydrawer.dart';
import 'package:cash_vic/app/widgets/popupmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'contest_list_view.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/home_images/drawer.svg',
              color: Colors.black,
              width: 25,
              height: 25,
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          title: Image.asset(
            IntroImages.cash_vic,
            height: 40,
            width: 100,
          ),
          automaticallyImplyLeading: false,
          // centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  // Get.toNamed('/notification');
                },
                child: Row(
                  children: [
                    Image.asset(
                      DrawerImages.wallet,
                      height: 30,
                    ),
                    widthSpace5,
                    GestureDetector(
                      onTap: () {
                        Get.to(WalletView());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 23,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: AppColors.greycolor.withOpacity(0.8))),
                        child: Obx(() => Text(
                              controller.currentBalance.toString(),
                              style: BaseStyles.blackbold15,
                            )),
                      ),
                    ),
                    widthSpace10,
                    Image.asset(
                      HomeImages.notification,
                      height: 30,
                    ),
                    widthSpace10,
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.to(ProfileView());
                    //   },
                    //   child: Image.asset(
                    //     HomeImages.maleicon,
                    //     height: 30,
                    //   ),
                    // ),
                  ],
                ))
          ],

          // ],
        ),
        drawer: mainDrawer(controller),
        body: ListView(
          children: [
            slider(),
            heightSpace10,
            itemslist(),
            heightSpace5,
            slider(),
            heightSpace10,
            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: BorderRadius.circular(5),
                border: Border(
                  top: BorderSide(color: AppColors.greycolor.withOpacity(0.5)),
                  left: BorderSide(color: AppColors.greycolor.withOpacity(0.5)),
                  right:
                      BorderSide(color: AppColors.greycolor.withOpacity(0.5)),
                  bottom:
                      BorderSide(color: AppColors.greycolor.withOpacity(0.5)),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hot Offers',
                                  style: BaseStyles.black18,
                                ),
                                Text(
                                  'Earn & Withdraw',
                                  style: BaseStyles.grey12,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              popupmenu(context);
                            },
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
                          )
                        ],
                      ),
                    ),
                    heightSpace10,
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.contestdata.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          var item = controller.contestdata[index];
                          final category = item.contestCategory;
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(OffersView(
                                    data: item,
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
                                              item.image,
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
                                                Text(item.name,
                                                    style: BaseStyles.black15),
                                                heightSpace5,
                                                SizedBox(
                                                  width: Get.width * 0.40,
                                                  child: Text(item.category,
                                                      style: BaseStyles.grey13),
                                                ),
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
                                        padding: const EdgeInsets.only(top: 5),
                                        child: getitem(
                                          name: 'Get ${item.price}',
                                        ),
                                      ),
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
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            heightSpace20
          ],
        ));
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
        style: BaseStyles.whiteBold15,
      ),
    );
  }

  itemslist() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greycolor.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(8),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0),
          itemCount: controller.data.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Get.to(DailySpinView());
                    break;
                  case 1:
                    Get.to(ReferAndEarnView());
                    break;
                  case 3:
                    Get.to(ShopcategoriesView());
                    break;

                  case 2:
                    Get.to(GameCategoriesView());
                    break;
                  default:
                    Get.to(ContestListView(
                      category: ContestCategory.all,
                    ));
                    break;
                }
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    // margin:
                    //     EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    // decoration: BoxDecoration(
                    //   color: AppColors.greycolor,
                    //   borderRadius: BorderRadius.circular(15.0),
                    //   border:
                    //       Border.all(width: 0.3, color: AppColors.greycolor),
                    // boxShadow: <BoxShadow>[
                    //   BoxShadow(
                    //     blurRadius: 1.0,
                    //     spreadRadius: 1.0,
                    //     color: AppColors.greycolor,
                    //   ),
                    // ],
                    // ),
                    //  child:  SvgPicture.asset(
                    //           'assets/home_images',
                    //           // color: AppColors.whiteColor,
                    //           theme: SvgTheme(currentColor: AppColors.whitecolor),
                    //         ),
                    child: Image.asset(
                      controller.data[index]['images'].toString(),
                      height: 40,
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Expanded(
                    child: Text(
                      controller.data[index]['name'].toString(),
                      style: BaseStyles.grey13,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  slider() {
    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
              height: 120,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.sliderCurrentIndex.value = index;
              }),
          items: List.generate(3, (index) {
            return Container(
              // height: 116,
              width: Get.width * 0.95,
              padding: const EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  HomeImages.slider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
        Container(
          padding: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              // color: AppColors.greycolor,
              ),
          child: SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return pointer1(index);
              },
            ),
          ),
        ),
      ],
    );
  }

  pointer1(index) {
    return Obx(
      () => Container(
        width: 5.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.sliderCurrentIndex.value == index
                ? Colors.grey.shade200
                : Color(0xffD9D9D9)),
      ),
    );
  }
}
