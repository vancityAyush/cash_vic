import 'package:cash_vic/app/constants/app_basestyles.dart';
import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_view.dart';

class TermconditionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Myappbar(name: 'Terms & Conditions'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Condition of Use',
                style: BaseStyles.blackbold15,
              ),
              heightSpace10,
              Container(
                // margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                decoration: decorationbox(color: Color(0xffF6F6F6)),
                child: Text(
                  """By registering with ‘Cash Vic‘ application, you agree that you have read and understand all the Terms & Conditions. Failure to this, your account will be permanently locked and you will no longer be eligible to claim any rewards / Money collected in your Cash Vic account.

              \n1.	For the purpose of registering with Cash Vic application, your agree to receive the One Time Password( OTP) from Cash Vic App that will verify your mobile number for your account.
              \n2.	Registering with multiple mobiles numbers on the same devices is not allowed, even if the device can support multi SIM.
              \n3.	Cash Vic app can’t be used with Android Emulators. The company follow a rigorous fraud prevention technologies to measure and catch such incidence. If any user is found doing so, his/her accounts get blocked completely for any future activity.
              \n4.	Cash Vic reserves the right to limit rewards enrolment at any time.
              \n5.	Cash Vic doesn’t promote any business or corporate entity to be a part of its program.
              \n6.	Cash Vic is under no obligation to provide Members with any particular amount of earning opportunities or send messages to them.
              \n7.	Cash Vic and its related services are currently being offered the Indian users who are 16 years in age and Cash Vic has it control to block the access of the application to particular individual by means of restricting their respective IP or Email Address or Mobile no.
              \n8.	There could be times when a user is being redirected from Cash Vic app to download a APK file out of playstore to complete the process & get rewarded. In such a scenario, user is advised to review and proceed on its own risk. Cash Vic is not liable for any consequences arise out of this.
              \n9.	The usage right of Cash Vic and its related service is limited to one individual with single mobile number and associated mobile device.
              \n10.	Member agrees to comply with the terms of all Cash Vic and its advertiser and partner offers, promotions, and programs at all times.
              \n11.	Earning amount & rewards are subject to change at any time without prior notice.
              \n12.	Earned amount will be subtracted from Member‘s account once the redemption order is placed by the member and captured by the Cash Vic server system. Who do not complete any transactions in the Service for a period of 30 days on a continuous basis would have their Cash Vic App credit forfeited.
              \n13.	No member is allowed to use or create fake ID or provide any fake profile information for earning money.
              \n14.	Members are strictly prohibited to uninstall any mobile app to reinstall it through Cash Vic for earning. Once any mobile app is installed through any channel (via Cash Vic, through Play Store directly or through any other similar program), Earned amount rewards cannot be claimed by uninstalling & reinstalling the same mobile app.
              \n 15.	Member agrees to promptly notify support@cashvic.com of any change in Member‘s mobile number or email address or personal profile by updating his or her personal information in the Profile section of Cash Vic mobile app.
              \n16.	Cash Vic reserves the right to cancel or disable accounts and expire unredeemed earned amount in those accounts that are inactive for a period of 6 consecutive months. Inactive shall be defined as lack of one of the following: accessing and utilizing offers, viewing video, profile update or any earning or spending transaction amount.
              \n17.	Cash Vic reserves the right to change this Agreement, and/or any part thereof, at any time as required by the Local Laws of the Land, Internet Usage policy, Telecom Regulatory policy, Android user’s usage policy, Cash Vic Privacy Policy. Member understands the most recent version of this Agreement will be located on the Pocket Money Website and/or Mobile application in the Member Services area under Terms of Service.
              
              \nCashVic reserves the right, at its sole discretion, to change, modify, add or remove portions of these Terms & Conditions, at any time without any prior written notice to the User. It is the User’s responsibility to review these Terms & Conditions periodically for any updates/ changes. User’s continued use of the Platform following the modification of these Terms & Conditions will imply the acceptance by the User of the revisions. Cash Vic reserves the right to modify or discontinue the Cash Vic service with or without notice to Member.
        """,
                  style: BaseStyles.grey15,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              child: GestureDetector(
            onTap: () {
              Get.to(HomeView());
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: Get.width * 0.43,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'ACCEPT',
                style: BaseStyles.whiteBold15,
              ),
            ),
          )),
          Container(
              child: GestureDetector(
            onTap: () {
              // Get.to(HomeView());
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: Get.width * 0.43,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'DECLINE',
                style: BaseStyles.greybold15,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
