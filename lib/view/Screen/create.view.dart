import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/view/Screen/global.colors.dart';
import 'package:flutter_auth/view/widgets/button.global.dart';
import 'package:flutter_auth/view/widgets/text.form.global.dart';
import 'login.view.dart';

class CreateView extends StatelessWidget {
  final http.Client httpClient = http.Client();

  CreateView({required Key key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> sendDataToServer(BuildContext context) async {
    const url = 'http://localhost:4500/users';

    try {
      final response = await httpClient.post(
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
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Data sent successfully');
        
        // Parse the response body
        final responseData = json.decode(response.body);
        
        // Check if registration was successful
        if (responseData['success'] == true) {
          // Show registration success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Registration successful'),
            ),
          );

          // Navigate to login page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(responseData['message'] ?? 'Registration failed'),
            ),
          );
        }
      } else {
        // Handle error response
        print('Failed to send data: ${response.statusCode}');
        // You can show an error message to the user here
      }
    } catch (error) {
      // Handle exceptions
      print('Error: $error');
      // You can show an error message to the user here
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
                  controller: nameController,
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
                  controller: emailController,
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
                  controller: passwordController,
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
                  controller: confirmPasswordController,
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
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      // Add your sign-up logic here
                      sendDataToServer(context); // Call function to save data to database
                    } else {
                      // Show password mismatch error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Password does not match'),
                        ),
                      );
                    }
                  },
                  text: 'Sign Up', btnColor: GlobalColors.mainColor, txtColor: GlobalColors.mainColor,
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
              onTap: () {
                // Navigate to login page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginView()));
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
