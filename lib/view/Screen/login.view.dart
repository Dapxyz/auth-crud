import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_auth/view/Screen/global.colors.dart';
import 'package:flutter_auth/view/widgets/button.global.dart';
import 'package:flutter_auth/view/widgets/social.login.dart';
import 'package:flutter_auth/view/widgets/text.form.global.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'create.view.dart';
import 'home_screen.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key, });

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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successful'),
            ),
          );

        Get.offAll(() => const Home());

        } else {
          // Show error message for unsuccessful login
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed. Please check your credentials.'),
            ),
          );
        }
      } else {
        // Show error message for unsuccessful request
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send data to server. Please try again later.'),
          ),
        );
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

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
                  controller: emailController,
                  text: 'Email',
                  textInputType: TextInputType.emailAddress,
                  obscure: false,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  obscure: true,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ButtonGlobal(
                  onPressed: () {
                    // Call function to send data to server
                    sendDataToServer(context);
                  },
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
              onTap: () {
                // Navigate to CreateView when Sign Up is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateView(key: const Key(''))),
                );
              },
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
