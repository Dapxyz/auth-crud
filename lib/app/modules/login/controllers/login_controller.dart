import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> sendDataToServer(BuildContext context) async {
    const url = 'http://localhost:4500/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Data sent successfully');

        // Parse the response body
        final responseData = json.decode(response.body);

        // Check if login was successful
        if (responseData['success'] == true) {
          // Show login success message
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login successful'),
              ),
            );
          }

          Get.offNamed(Routes.HOME);
        } else {
          // Show error message for unsuccessful login
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login failed. Please check your credentials.'),
              ),
            );
          }
        }
      } else {
        // Show error message for unsuccessful request
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to send data to server. Please try again later.'),
            ),
          );
        }
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

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
