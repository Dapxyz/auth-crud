// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
// import 'package:flutter_auth/view/Screen/global.colors.dart';
// import 'package:flutter_auth/view/widgets/button.global.dart';
// import 'package:flutter_auth/view/widgets/text.form.global.dart';
// import 'login.view.dart';

// class CreateView extends StatelessWidget {
//   CreateView({super.key});

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();

//   Future<void> sendDataToServer(BuildContext context) async {
//     const url = 'http://ipconfig/users';
//     final dio = Dio();
//     try {
//       await dio
//           .post(
//         url,
//         data: json.encode({
//           'name': nameController.text,
//           'email': emailController.text,
//           'password': passwordController.text,
//           'confPassword': passwordController.text,
//         }),
//         options: Options(headers: {
//           'Accept': 'application/json',
//           'Content-Type': 'application/json',
//         }),
//       )
//           .then((value) {
//         if (value.statusCode == 200) {
//           // Handle successful response
//           print('Data sent successfully');

//           // Parse the response body
//           if (context.mounted) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Registration successful'),
//               ),
//             );
//             Get.to(LoginView());
//           }
//         } else {
//           // Handle error response
//           print('Failed to send data: ${value.statusCode}');

//           // You can show an error message to the user here
//         }
//       });
//     } catch (error) {
//       // Handle exceptions
//       print('Error: $error');
//       // You can show an error message to the user here
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Dap-X',
//                     style: TextStyle(
//                       color: GlobalColors.mainColor,
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Mobile Programming Apps',
//                     style: TextStyle(
//                       color: GlobalColors.mainColor,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 Text(
//                   'Create Your Account',
//                   style: TextStyle(
//                     color: GlobalColors.mainColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 // Name input
//                 TextFormGlobal(
//                   controller: nameController,
//                   text: 'Name',
//                   textInputType: TextInputType.name,
//                   obscure: false,
//                   onChanged: (value) {
//                     return;
//                   },
//                   validator: (value) {
//                     return;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 // Email input
//                 TextFormGlobal(
//                   controller: emailController,
//                   text: 'Email',
//                   textInputType: TextInputType.emailAddress,
//                   obscure: false,
//                   validator: (value) {
//                     return;
//                   },
//                   onChanged: (value) {
//                     return;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 // Password input
//                 TextFormGlobal(
//                   controller: passwordController,
//                   text: 'Password',
//                   textInputType: TextInputType.visiblePassword,
//                   obscure: true,
//                   validator: (value) {
//                     return;
//                   },
//                   onChanged: (value) {
//                     return;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 // Confirm Password input
//                 TextFormGlobal(
//                   controller: confirmPasswordController,
//                   text: 'Confirm Password',
//                   textInputType: TextInputType.visiblePassword,
//                   obscure: true,
//                   validator: (value) {
//                     return;
//                   },
//                   onChanged: (value) {
//                     return;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 // Sign up button
//                 ButtonGlobal(
//                   onPressed: () async {
//                     if (nameController.text.isNotEmpty &&
//                         emailController.text.isNotEmpty &&
//                         passwordController.text.isNotEmpty &&
//                         confirmPasswordController.text.contains(passwordController.text)) {
//                       sendDataToServer(context); // Call function to save data to database
//                     } else {
//                       // Show password mismatch error
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Empty form'),
//                         ),
//                       );
//                     }
//                   },
//                   text: 'Sign Up',
//                   btnColor: GlobalColors.mainColor,
//                   txtColor: GlobalColors.mainColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 50,
//         color: Colors.white,
//         alignment: Alignment.center,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Already have an account? ',
//               style: TextStyle(color: GlobalColors.mainColor),
//             ),
//             InkWell(
//               onTap: () {
//                 // Navigate to login page
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
//               },
//               child: Text(
//                 'Login',
//                 style: TextStyle(color: GlobalColors.mainColor, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
