import 'package:get/get.dart';

import '../../../constants/values.dart';

class GameCategoriesController extends GetxController {
  //TODO: Implement GameCategoriesController

  final List<Map<String, dynamic>> items = [
    {
      "name": "Arcade",
      "images": HomeImages.arcade,
      "category": ContestCategory.arcade,
    },
    {
      "name": "Puzzle",
      "images": HomeImages.puzzle,
      "category": ContestCategory.puzzle,
    },
    {
      "name": "Educational",
      "images": HomeImages.educational,
      "category": ContestCategory.educational,
    },
    {
      "name": "Brain Games",
      "images": HomeImages.brainGames,
      "category": ContestCategory.brain,
    },
    {
      "name": "Casino",
      "images": HomeImages.casino,
      "category": ContestCategory.casino,
    },
    {
      "name": "Fantasy",
      "images": HomeImages.fantasy,
      "category": ContestCategory.fantasy,
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
