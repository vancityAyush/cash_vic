import 'package:cash_vic/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/services/ApiService.dart';

void main() async {
  await await Get.putAsync(() => ApiService().init());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.whitecolor,
        ),
        fontFamily: 'Poppins',
        primaryColor: AppColors.secondaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
