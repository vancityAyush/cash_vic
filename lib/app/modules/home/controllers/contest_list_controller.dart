import 'package:cash_vic/app/models/contest.dart';
import 'package:cash_vic/app/services/ApiService.dart';
import 'package:get/get.dart';

import '../../../constants/values.dart';

class ContestListController extends GetxController {
  final RxList<Contest> contestList = <Contest>[].obs;
  final RxBool isLoading = true.obs;
  final ApiService apiService = Get.find<ApiService>();
  Map<ContestCategory, String> categoryMap = {
    ContestCategory.arcade: "Arcade",
    ContestCategory.puzzle: "Puzzle",
    ContestCategory.brain: "Brain Games",
    ContestCategory.casino: "Casino",
    ContestCategory.fantasy: "Fantasy",
    ContestCategory.electronics: "Electronics",
    ContestCategory.educational: "Educational",
    ContestCategory.bogo: "Buy One Get One",
    ContestCategory.health: "Health",
    ContestCategory.beauty: "Beauty",
    ContestCategory.footwear: "Footwear",
    ContestCategory.jewellery: "Jewellery",
    ContestCategory.clothing: "Clothing",
  };

  @override
  void onInit() {
    super.onInit();
    apiService.fetchContest().then((value) {
      if (value != null) {
        contestList.addAll(value);
      }
      isLoading.value = false;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
