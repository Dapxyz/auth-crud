import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxString name = ''.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> _handleUsers(String accessToken) async {
    const url = 'http://localhost:4500/users';
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        name.value = responseData['name'];
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _prefs.then((value) {
      if (value.getString('token') != null) {
        _handleUsers(value.getString('token')!);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
