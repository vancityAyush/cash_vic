import 'package:get_storage/get_storage.dart';

Save_Otp() {
  var box = GetStorage();
  return box.read('otp') ?? '';
}

Save_Username() {
  var box = GetStorage();
  return box.read('username') ?? '';
}

token() {
  var box = GetStorage();
  return box.read('key') ?? '';
}

userID() {
  var box = GetStorage();
  return box.read('userID') ?? '';
}
