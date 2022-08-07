import 'package:cash_vic/app/modules/home/controllers/aboutus_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/addbankdetails_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/addbankuser_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/bank_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/contest_list_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/login_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/myprofile_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/offers_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/privacy_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/profile_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/shopcategories_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/signup_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/termcondition_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/wallet_controller.dart';
import 'package:cash_vic/app/modules/home/controllers/welcome_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyprofileController>(
      () => MyprofileController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ContestListController>(
      () => ContestListController(),
    );
    Get.lazyPut<OffersController>(
      () => OffersController(),
    );
    Get.lazyPut<TermconditionController>(
      () => TermconditionController(),
    );
    Get.lazyPut<PrivacyController>(
      () => PrivacyController(),
    );
    Get.lazyPut<AboutusController>(
      () => AboutusController(),
    );
    Get.lazyPut<AddbankuserController>(
      () => AddbankuserController(),
    );
    Get.lazyPut<BankController>(
      () => BankController(),
    );
    Get.lazyPut<AddbankdetailsController>(
      () => AddbankdetailsController(),
    );
    Get.lazyPut<ShopcategoriesController>(
      () => ShopcategoriesController(),
    );
    Get.lazyPut<WalletController>(
      () => WalletController(),
    );
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
