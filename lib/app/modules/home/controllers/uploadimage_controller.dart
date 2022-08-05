import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreenController extends GetxController {
  late XFile pickedFile;
  var selectedImagepath = ''.obs;
  var selectedImageSize = ''.obs;
  final pickFileLoading = false.obs;
  final isfilepicked = false.obs;
  var fileName = ''.obs;
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
  imagecontroller(ImageSource imageSource) async {
    pickedFile = (await ImagePicker().pickImage(source: imageSource))!;
    print(pickedFile.toString() + "manoj");
    if (pickedFile != '') {
      selectedImagepath.value = pickedFile.path;
      pickFileLoading.value = true;
      isfilepicked.value = true;
      fileName.value = pickedFile.path.split('/').last;
    } else {}
  }
}
