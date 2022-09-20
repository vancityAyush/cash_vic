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
  final currentFilter = (-1).obs;

  final filteredList = <Contest>[].obs;
  void Filter(ContestCategory category) {
    filteredList.clear();
    List<Contest> temp =
        contestList.where((p0) => p0.contestCategory == category).toList();
    switch (currentFilter.value) {
      case 0:
        Contest max = temp[0];
        for (Contest item in temp) {
          if (item.price > max.price) {
            max = item;
          }
        }
        filteredList.value = [max];
        break;
      case 1:
        filteredList.addAll(temp);
        break;
      case 2:
        Contest less = temp[0];
        for (Contest item in temp) {
          if (less.effort < item.effort) {
            less = item;
          }
        }
        filteredList.value = [less];
        break;
      case 3:
        filteredList.addAll(temp);
        filteredList.sort((a, b) => a.startDate.compareTo(b.startDate));

        while (filteredList.length > 5) {
          filteredList.removeLast();
        }
        print(filteredList.length);
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    apiService.fetchContest().then((value) {
      if (value != null) {
        contestList.addAll(value);
        filteredList.addAll(value);
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
