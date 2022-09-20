import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:cash_vic/app/widgets/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeqView extends GetView {
  List<Map<String, String>> QnAs = [
    {
      'Q': "How can I earn from this app?",
      "A":
          "You just need to choose the task you want to perform and on every task you complete, you will get the respective earnings. Simply choose an offer, understand the requirement and earn unlimited."
    },
    {
      'Q': "What is the Spin Wheel option in this App?",
      "A":
          "This is a feature we have designed for our customers to win Additional money even if they are not performing any task or they don’t have any new task to perform."
    },
    {
      'Q':
          'How this app is different from other apps that are available in the market and gives reward.',
      'A':
          'Cash Vic gives you variety of options to choose from. You get multiple new offers where you can make fresh money.\nOur Exclusive Shop option gives you an opportunity to even earn on your daily needs.'
    },
    {
      'Q': 'What is the meaning of this App?',
      'A':
          """Well, here Cash represents your rewarding money which you receive and Vic stands for you as our Very Important Customers"""
    },
    {
      'Q':
          "How can I earn by sharing referral links with my friend and do we really get money when we refer somebody?",
      'A':
          """Our Referral program gives you an option to earn while referring the app to your Family/Friends. You just need to Copy your Referral Code and Share with Friends. 

Once your friends use this referral code and Sign up with CashVic App very first time, you receive the referral bonus.

And yes, you get money for all successful referrals and this money directly goes to your wallet.
"""
    },
    {
      'Q':
          "I’m receiving my reward money in Coins, how would I receive this amount in Indian Rupees INR?",
      'A':
          """The app is designed in a way that your earnings are shown in Coins. 1 Coins means 1 Paisa. For example, 100 Coins= INR 1, 1000 Coins= INR 10, 10000 Coins= INR 100 & So on.
Our system automatically converts these Coins into INR when we transfer the amount to your associated Bank Account.
"""
    },
    {
      'Q': 'Where do I see my earnings in the app?',
      'A': 'You see your earning in your wallet.',
    },
    {
      'Q': 'When can I withdraw my earnings, is there any cap over it?',
      'A':
          'You can only withdraw your earning when you achieve 20000 Coins, that’s, INR 200. This is the minimum threshold to raise any withdrawal request.'
    },
    {
      'Q': 'Is linking a Pan Card to my account mandatory?',
      'A':
          'Your Pan card details are mandatory as we are sending money to your bank account. It’s also mandatory that your name matches with your Pan Card & Bank Account'
    },
    {
      'Q':
          "How long it takes to get my earning money credited in my bank account?",
      'A':
          "Once you raise your request for withdrawal, it takes 2-3 business days to process the amount into your account."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Myappbar(name: 'Frequently Asked Questions'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently Asked Questions',
                style: BaseStyles.blackbold15,
              ),
              heightSpace20,
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => heightSpace20,
                  itemCount: QnAs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      // height: Get.height,
                      padding: EdgeInsets.all(8.0),
                      decoration: decorationbox(color: Color(0xffF6F6F6)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q: " + QnAs[index]['Q']!,
                            style: BaseStyles.blackbold15,
                          ),
                          heightSpace10,
                          Text(
                            QnAs[index]['A'] ?? "null",
                            style: BaseStyles.grey12,
                          ),
                          heightSpace20,
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
