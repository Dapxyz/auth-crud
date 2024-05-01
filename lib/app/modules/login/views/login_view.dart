import 'package:flutter/material.dart';
import 'package:flutter_auth/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../constant/global.colors.dart';
import '../../../../view/widgets/button.global.dart';
import '../../../../view/widgets/social.login.dart';
import '../../../../view/widgets/text.form.global.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  @override
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Dap-X',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Mobile Programming Apps',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Login To Your Account',
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: controller.emailController,
                  text: 'Email',
                  textInputType: TextInputType.emailAddress,
                  obscure: false,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return 'Please enter your email';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormGlobal(
                  controller: controller.passwordController,
                  text: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  obscure: true,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return 'Please enter your password';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ButtonGlobal(
                  onPressed: () =>
                      // Call function to send data to server
                      controller.sendDataToServer(context),
                  text: 'Sign In',
                  btnColor: GlobalColors.mainColor,
                  txtColor: Colors.white,
                ),
                const SizedBox(height: 25),
                const SocialLogin(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: TextStyle(color: GlobalColors.mainColor),
            ),
            InkWell(
              onTap: () => Get.offNamed(Routes.REGISTER),
              child: Text(
                'Sign Up',
                style: TextStyle(color: GlobalColors.mainColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
