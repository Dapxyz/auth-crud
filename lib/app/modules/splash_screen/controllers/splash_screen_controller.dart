import 'package:flutter_auth/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 3000)).then((value) => Get.offNamed(Routes.LOGIN));
    super.onInit();
  }
}
