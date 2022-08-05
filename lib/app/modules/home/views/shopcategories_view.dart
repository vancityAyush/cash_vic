import 'dart:math';

import 'package:cash_vic/app/constants/values.dart';
import 'package:cash_vic/app/modules/home/controllers/shopcategories_controller.dart';
import 'package:cash_vic/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import 'gamelist_view.dart';

class ShopcategoriesView extends GetView<ShopcategoriesController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ShopcategoriesController());
    return Scaffold(
        appBar: Myappbar(
          image: HomeImages.female,
          name: 'Exclusive Shop Categories',
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
                Get.to(GamelistView());
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
                        'assets/home_images/Aroma.png',
                        // scale: 3,
                      ),
                      heightSpace30,
                      Text(
                        controller.items[index]['list'][index].toString(),
                        style: BaseStyles.black14,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
