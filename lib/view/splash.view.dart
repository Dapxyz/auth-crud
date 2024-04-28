import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import package for SVG
import 'package:get/get.dart'; // Import GetX package
import 'package:flutter_auth/view/Screen/global.colors.dart';
import 'package:flutter_auth/view/Screen/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(LoginView(key: super.key,)); 
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/anonymous.svg',
              width: 100, 
              height: 100,
            ),
            const SizedBox(height: 10), 
            const Text(
              'DAP-X',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2), // Spacer
            const Text(
              'Mobile Programming',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
