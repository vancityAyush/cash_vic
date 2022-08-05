/**
 * Created by : Ayush Kumar
 * Created on : 03-08-2022
 */
import 'package:dio/dio.dart';

Future<dynamic> getdata() async {
  final dio = Dio();
  final res = await dio.get(
      "https://api.offer18.com/api/af/offers?key=accdb2e68678a788b27ead8160d42123&aid=390112&mid=2127");
  if (res.statusCode == 200) {
    print(res.data);
    Map data = res.data['data'] as Map;
    List<String> keys = data.keys.toList() as List<String>;
    List<dynamic> values = data.values.toList() as List<dynamic>;
    print(values.first["name"]);
    return data;
  } else {
    print(res.statusCode);
    return null;
  }
}

void main() {
  getdata();
}
