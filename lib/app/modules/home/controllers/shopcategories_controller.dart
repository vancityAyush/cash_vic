import 'package:get/get.dart';

import '../../../constants/values.dart';

class ShopcategoriesController extends GetxController {
  //TODO: Implement ShopcategoriesController

  // electronics, beauty, clothing, footwear, jewellery, fashion
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Electronics',
      'images': HomeImages.electronics,
      'category': ContestCategory.electronics,
    },
    {
      'name': 'Beauty',
      'images': HomeImages.beauty,
      'category': ContestCategory.beauty,
    },
    {
      'name': 'Health',
      'images': HomeImages.health,
      'category': ContestCategory.health,
    },
    {
      'name': 'Footwear',
      'images': HomeImages.footwear,
      'category': ContestCategory.footwear,
    },
    {
      'name': 'Clothing',
      'images': HomeImages.clothing,
      'category': ContestCategory.clothing,
    },
    {
      'name': 'Jewellery',
      'images': HomeImages.jewellery,
      'category': ContestCategory.jewellery,
    },
    {
      'name': 'Buy One Get One',
      'images': HomeImages.bogo,
      'category': ContestCategory.bogo,
    },
  ];
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
