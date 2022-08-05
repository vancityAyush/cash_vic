import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/views/aboutus_view.dart';
import 'package:cash_vic/app/modules/home/views/addbankdetails_view.dart';
import 'package:cash_vic/app/modules/home/views/addbankuser_view.dart';
import 'package:cash_vic/app/modules/home/views/feq_view.dart';
import 'package:cash_vic/app/modules/home/views/privacy_view.dart';
import 'package:cash_vic/app/modules/home/views/termcondition_view.dart';
import 'package:cash_vic/app/modules/home/views/wallet_view.dart';
import 'package:cash_vic/app/widgets/sign_out.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/home/views/myprofile_view.dart';

// import '../modules/home/views/profile_view.dart';

mainDrawer(controller) {
  return Obx(
    () => SizedBox(
      width: 280,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: DrawerHeader(
                    curve: Curves.bounceInOut,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${"https://cashvic.frantic.in/" + controller.drawerdata['image'].toString()}",
                            height: Get.height * 0.60,
                            width: Get.width,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: AppColors.whitecolor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: AppColors.secondaryColor,
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        // CircleAvatar(
                        //   radius: 50,
                        //   backgroundColor: AppColors.whitecolor,
                        //   backgroundImage: NetworkImage(
                        //       "${"https://cashvic.frantic.in/" + controller.drawerdata['image'].toString()}"),
                        // ),
                        Text(
                          controller.drawerdata['name'].toString(),
                          style: BaseStyles.whitebold20,
                        )
                      ],
                    )),
              ),
              heightSpace10,
              // _draweritem(
              //     index: 1,
              //     controller: controller,
              //     icon: DrawerImages.term,
              //     title: DrawerDetails.tc,
              //     action: () {}),
              // heightSpace10,
              _draweritem(
                  controller: controller,
                  index: 0,
                  icon: DrawerImages.maleicon,
                  title: DrawerDetails.profile,
                  action: () {
                    Get.back();
                    Get.to(MyprofileView());
                    // Get.toNamed('/home');
                  }),
              SizedBox(height: 10),
              _draweritem(
                  controller: controller,
                  index: 7,
                  icon: DrawerImages.wallet,
                  title: DrawerDetails.wallet,
                  action: () {
                    Get.back();
                    Get.to(WalletView());
                    // Get.toNamed('/home');
                  }),
              SizedBox(height: 10),
              _draweritem(
                  index: 1,
                  controller: controller,
                  icon: DrawerImages.admin,
                  title: DrawerDetails.about,
                  action: () {
                    Get.back();
                    Get.to(AboutusView());
                  }),
              heightSpace10,
              _draweritem(
                  index: 2,
                  controller: controller,
                  icon: DrawerImages.bank,
                  title: DrawerDetails.addbank,
                  action: () {
                    Get.back();
                    Get.to(AddbankuserView());
                  }),
              heightSpace10,
              _draweritem(
                  index: 3,
                  controller: controller,
                  icon: DrawerImages.visibility,
                  title: DrawerDetails.privacy,
                  action: () {
                    Get.back();
                    Get.to(PrivacyView());
                  }),
              heightSpace10,
              _draweritem(
                  index: 4,
                  controller: controller,
                  icon: DrawerImages.conver,
                  title: DrawerDetails.feq,
                  action: () {
                    Get.back();
                    Get.to(FeqView());
                  }),
              heightSpace10,
              _draweritem(
                  index: 5,
                  controller: controller,
                  icon: DrawerImages.term,
                  title: DrawerDetails.tc,
                  action: () {
                    Get.back();
                    Get.to(TermconditionView());
                  }),
              heightSpace10,
              _signout(controller: controller, index: 6),
              heightSpace10,
            ],
          ),
        ),
      ),
    ),
  );
}

_draweritem(
    {required controller,
    required index,
    required icon,
    required title,
    required Function() action}) {
  return GestureDetector(
    onTap: () {
      controller.selectedtab.value = index;
      print(controller.selectedtab.value);
      Future.delayed(Duration(milliseconds: 500), () {
        controller.selectedtab.value = 0;
      });
      // action;
    },
    child: GestureDetector(
      onTap: action,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: AppColors.whitecolor,
            boxShadow: [
              BoxShadow(
                color: Colors.transparent,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Image.asset(
                icon,
                height: 65,
                width: 39,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: TextStyle(
                    color: AppColors.blackcolor,
                    fontSize: 15,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

_signout({
  required index,
  required controller,
}) {
  return InkWell(
    onTap: () {
      controller.selectedtab.value = index;
      Get.back();
      Future.delayed(Duration(milliseconds: 500), () {
        controller.selectedtab.value = 0;
      });
      signout(controller);
    },
    child: Container(
      height: 45,
      decoration: BoxDecoration(
          color: controller.selectedtab.value == index
              ? AppColors.secondaryColor
              : AppColors.whitecolor,
          boxShadow: [
            BoxShadow(
              color: controller.selectedtab.value == index
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Container(
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Image.asset(
                DrawerImages.logout,
                color: controller.selectedtab.value == index
                    ? AppColors.whitecolor
                    : AppColors.secondaryColor,
                height: 65,
                width: 39,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                DrawerDetails.logout,
                style: TextStyle(
                    color: controller.selectedtab.value == index
                        ? AppColors.secondaryColor
                        : AppColors.blackcolor,
                    fontSize: 15,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
