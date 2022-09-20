import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/privacy_controller.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyView extends GetView<PrivacyController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PrivacyController());
    return Scaffold(
        appBar: Myappbar(name: 'Privacy Policy'),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  heightSpace20,
                  Container(
                    // width: Get.width * 0.90,
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
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
                            controller.Overview.value = true;
                          },
                          child: Container(
                            width: Get.width * 0.45,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: controller.Overview.value
                                    ? AppColors.greycolor4
                                    : Color(0xffF6F6F6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Text(
                              'Human-Friendly',
                              style: TextStyle(
                                  color: controller.Overview.value
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.Overview.value = false;
                          },
                          child: Container(
                            width: Get.width * 0.45,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: !controller.Overview.value
                                    ? AppColors.greycolor4
                                    : Color(0xffF6F6F6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Text(
                              'Overview',
                              style: TextStyle(
                                  color: !controller.Overview.value
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  heightSpace20,
                  Container(
                    // margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(8),
                    decoration: decorationbox(color: Color(0xffF6F6F6)),
                    child: RichText(
                      text: TextSpan(
                        text:
                            "Accelerate Media Pvt Ltd (hereinafter referred to as “CashVic or We/Our/us and Including ",
                        style: BaseStyles.grey12,
                        children: <TextSpan>[
                          TextSpan(
                            text: "www.cashvic.com",
                            style: BaseStyles.grey12.copyWith(
                              color: Colors.blue,
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                launch('https://www.cashvic.com');
                              },
                          ),
                          TextSpan(
                            text:
                                " values the privacy of its customers who share their personal information with us. It’s our commitment to provide this information a security and confidentiality so that there is no misuse of it.”).",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "By sharing your personal information with us by the means of your Registration ( Online/Offline) at CashVic, you allow CashVic and its business partners to set up a communication with you via phone call, email and SMS. The only purpose of contacting you is to introduce you with the promotional offers of CashVic or its business partners & associated third parties. Under this policy, you authorize us to contact you for the above-mentioned purposes even if your number is registered under DND/DNC/NCPR services. This authorization is valid until your account is active with us.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n\n"),
                          TextSpan(
                            text: "Collection of Information",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "At SavingCorner, we collect multiple type of information from our customers. You can find below the type of information we may collect from you and its purpose. By visiting our website and registering with us, you agree to this privacy policy",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "How do we use the information we collect",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "\n1.	Mobile Number:- We collect & verify your mobile number to make a note of your identity as all rewards are being given based on these numbers. The other uses are as follows\n•	Mobile Number is used to communicate with you the promotional offers \n•	Mobile Number is also used to help you with your account related queries",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "2.	Email Address:- Your Email address is captured to communicate the service alerts of Cashvic and also sharing with you the promotional mails. These promotional emails gives you an option to Unsubscribe as well ( if you don’t wish to receive in future).",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "Every email you receive from us comes up with the Unsubscribe Link which can be used easily to opt-out from our emailing list.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "3.	Gender, Age & State :- These demographic information’s are collected to customise the marketing messages/emails as per your needs. This is again our step to get you what best you deserve from us.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "4.	Name & Pan Card:- Your Pan Card is used to verify your identity. We take help of 3rd party service provider to validate these details of your Pan Card against your name.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "5.	Bank Details:- The Bank details are captured to make sure that your earned rewards( money) are only sent to your respective Bank. We  also use 3rd party service providers to validate your Bank Account Information  with your name on Pan Card.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "Information Disclosure & Sharing ",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "As described in this policy, we don’t sell or rent your personal information to third parties for any purpose. We only share your information when we have your clear consent or as otherwise provided for in this policy.\n\nWe may share your personal information with our business partners or with another entity in case of business merger or sale of any business part of CashVic. We may disclose your personal information in a non-personally identifiable manner that protects your identity and make it unidentified. We restrict the collection and use of your personal information, and don’t let anyone to use it except some internal procedures to manage, expand and improve our services. You may also get contacted from the third parties (whom we have our tie-ups with), bit with limited access. Such third parties are required to maintain the confidentiality of the information as we mentioned in our contract with them.\n\nWe may share your personal information with government agencies under the law in case of identity verification, investigation of cyber incidents, hearings and punishment of offences, or disclosure of information required for legal purpose. We may also need to disclose the information to third parties under the law. ",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "Cookies",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "Cookies are the temporary files that gets stored in the web browser of a user computer & mobile device. A cookie consists of some useful information about a user and with the help of which you can understand his browsing behavior, preference etc. \n\nWe use cookies on our websites as other lending websites & market places. The information we get from your cookies help us to identify you, your behavior on our website, your product preferences, your likes & dislikes and this eventually help us to improve our services and make our website/App more user friendly for you.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "File Logs",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "We use log files that include internet protocol (IP) address, internet service provider (ISP), browser type, exit or referred pages, date/time stamp, operating system to analyze trends and user's movements while visiting the website. This information is combined with the other information we collect about improving our services, site functionality and marketing.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "Third Party Advertising",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "CashVic uses ad agencies and third-party advertising companies to serve ads when the users visit our website/App. No personal identifiable information of our user are compromised to these Third Party Business partners. However, they may collect anonymous information about your visits to website/App and interaction with the product & services.\n\nIf You visit any Websites/App through the links on the CashVic Website/App, it’s advised you to check the privacy policy of each of those Websites/App before you submit any personal details to them. The privacy policy of information to these Websites/App is not our liability and we are not responsible for any loss of personal information.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "Email Opt out",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "If you don’t want to receive the emails or any promotional offfer from us, you can simply drop an email at support@cashvic.com and we would unsubscribe you from our list. It may take some time, but action will be done for sure.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "Reforms in Privacy Policy",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "This online privacy policy may change from time to time, at a sole discretion of CashVic \n\nThe effective date shown below describes the last time this policy was revised or materially changed.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "Security",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "CashVic use all suitable technical, electronic and procedural security measures to protect the personal information we collect from you.. Other methodologies are again deployed that in turns provide our users maximum protection over data breach from external threats. We use multiple security measures to protect illegal use, damage or loss of any information.\n\nSince no electronic storage of information can be guaranteed 100%, we can’t guarantee the complete security. Rest, we keep testing our system regularly to make sure that security systems are up to date.",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "Grievance Addressal",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "If you have any grievance with respect to the use of your personal information, please write us at support@Cashvic.com",
                            style: BaseStyles.grey12,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text: "Contact Us",
                            style: BaseStyles.blackbold15,
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                "In case of any query about the use of your personal information or this privacy policy statement, please contact us at contact@cashvic.com",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
