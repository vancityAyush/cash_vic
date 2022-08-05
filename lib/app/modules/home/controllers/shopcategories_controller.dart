import 'dart:math';

import 'package:get/get.dart';

class ShopcategoriesController extends GetxController {
  //TODO: Implement ShopcategoriesController

  final List<Map<String, dynamic>> items = List.generate(
      6,
      (index) => {
            "id": index,
            "title": "Item $index",
            "list": [
              'Electronics',
              'Beauty',
              'Footwear',
              'Clothing',
              'Jewellery',
              'Fashion'
            ]
          });
  final list = [
    'Electronics',
    'Beauty',
    'Footwear',
    'Clothing',
    'Jewellery',
    'Fashion'
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
