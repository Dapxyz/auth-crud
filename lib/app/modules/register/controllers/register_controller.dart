import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> sendDataToServer(BuildContext context) async {
    const url = 'http://ipconfig/users'; 
    try {
      await http.post(
        Uri.parse(url),
        body: json.encode({
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'confPassword': passwordController.text,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      ).then((value) {
        if (value.statusCode == 200) {
          // Handle successful response
          print('Data sent successfully');

          // Parse the response body
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registration successful'),
              ),
            );
            Get.offNamed(Routes.LOGIN);
          }
        } else {
          // Handle error response
          print('Failed to send data: ${value.statusCode}');

          // You can show an error message to the user here
        }
      });
    } catch (error) {
      // Handle exceptions
      print('Error: $error');
      // You can show an error message to the user here
    }
  }

  //TODO: Optional bisa dihapus kalau ndak di pakai
  @override
  void onInit() {
    super.onInit();
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
