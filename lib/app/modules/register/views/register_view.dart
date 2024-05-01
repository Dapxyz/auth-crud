import 'package:flutter/material.dart';
import 'package:flutter_auth/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../constant/global.colors.dart';
import '../../../../view/widgets/button.global.dart';
import '../../../../view/widgets/text.form.global.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});

  @override
  final controller = Get.find<RegisterController>();
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
                  'Create Your Account',
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                // Name input
                TextFormGlobal(
                  controller: controller.nameController,
                  text: 'Name',
                  textInputType: TextInputType.name,
                  obscure: false,
                  onChanged: (value) {
                    return;
                  },
                  validator: (value) {
                    return;
                  },
                ),
                const SizedBox(height: 10),
                // Email input
                TextFormGlobal(
                  controller: controller.emailController,
                  text: 'Email',
                  textInputType: TextInputType.emailAddress,
                  obscure: false,
                  validator: (value) {
                    return;
                  },
                  onChanged: (value) {
                    return;
                  },
                ),
                const SizedBox(height: 10),
                // Password input
                TextFormGlobal(
                  controller: controller.passwordController,
                  text: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  obscure: true,
                  validator: (value) {
                    return;
                  },
                  onChanged: (value) {
                    return;
                  },
                ),
                const SizedBox(height: 10),
                // Confirm Password input
                TextFormGlobal(
                  controller: controller.confirmPasswordController,
                  text: 'Confirm Password',
                  textInputType: TextInputType.visiblePassword,
                  obscure: true,
                  validator: (value) {
                    return;
                  },
                  onChanged: (value) {
                    return;
                  },
                ),
                const SizedBox(height: 10),
                // Sign up button
                ButtonGlobal(
                  onPressed: () async {
                    if (controller.nameController.text.isNotEmpty &&
                        controller.emailController.text.isNotEmpty &&
                        controller.passwordController.text.isNotEmpty &&
                        controller.confirmPasswordController.text.contains(controller.passwordController.text)) {
                      controller.sendDataToServer(context); // Call function to save data to database
                    } else {
                      // Show password mismatch error
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Empty form'),
                        ),
                      );
                    }
                  },
                  text: 'Sign Up',
                  btnColor: GlobalColors.mainColor,
                  txtColor: GlobalColors.mainColor,
                ),
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
              'Already have an account? ',
              style: TextStyle(color: GlobalColors.mainColor),
            ),
            InkWell(
              onTap: () => Get.offNamed(Routes.LOGIN),
              child: Text(
                'Login',
                style: TextStyle(color: GlobalColors.mainColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
