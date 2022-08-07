import 'dart:math';

import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/gamecategories_controller.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'contest_list_view.dart';

class GameCategoriesView extends GetView<GameCategoriesController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => GameCategoriesController());
    return Scaffold(
      appBar: Myappbar(
        image: HomeImages.female,
        name: 'Game Categories',
      ),
      body: MasonryGridView.count(
        itemCount: controller.items.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        // the number of columns
        crossAxisCount: 2,
        // vertical gap between two items
        mainAxisSpacing: 15,
        // horizontal gap between two items
        crossAxisSpacing: 15,
        itemBuilder: (context, index) {
          // display each item with a card
          return GestureDetector(
            onTap: () {
              Get.to(ContestListView(
                category: controller.items[index]['category'],
              ));
            },
            child: SizedBox(
              height: index.isEven ? Get.height * 0.38 : Get.height * 0.30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color.fromARGB(
                          Random().nextInt(256),
                          Random().nextInt(256),
                          Random().nextInt(256),
                          Random().nextInt(256))
                      .withOpacity(0.3),
                ),

                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(
                //   vertical: 50,
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      controller.items[index]['images'],
                      height: 100,
                      // scale: 3,
                    ),
                    heightSpace30,
                    Text(
                      controller.items[index]['name'],
                      style: BaseStyles.black14,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
