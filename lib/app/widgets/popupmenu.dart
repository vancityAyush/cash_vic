import 'package:cash_vic/app/constants/app_colors.dart';
import 'package:cash_vic/app/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

popupmenu(context) {
  return showModalBottomSheet(
    //isDismissible: true,
    // enableDrag: true,
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true, // set this to true
    builder: (context) {
      return Container(
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: AppColors.whitecolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 5),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    HomeImages.cancel,
                    height: 20,
                  ),
                ),
              ),
            ),
            ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                dense: false,
                leading: Icon(Icons.schedule),
                title: Text('Max pay-out'),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                dense: false,
                leading: Icon(Icons.notifications),
                title: Text('Most Used'),
                onTap: () {
                  // controller.users.removeAt(i);
                  // Navigator.pop(context);
                }),
            ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                dense: false,
                leading: Icon(Icons.transform),
                title: Text('Less effort'),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                dense: false,
                leading: Icon(Icons.transform),
                title: Text('Recently added'),
                onTap: () {
                  Navigator.pop(context);
                }),
          ]),
        ),
      );
    },
  );
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// Homemore(context, controller, i) {
 
// }