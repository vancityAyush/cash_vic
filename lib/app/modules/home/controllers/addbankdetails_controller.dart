import 'package:get/get.dart';

class AddbankdetailsController extends GetxController {
  //TODO: Implement AddbankdetailsController

  final count = 0.obs;
  var bank = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
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
  void increment() => count.value++;
}
