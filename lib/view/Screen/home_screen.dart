import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/view/Screen/global.colors.dart'; // Pastikan path benar
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'crudpage.dart'; // Pastikan import halaman CRUD yang benar

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var name = '';
  @override
  void initState() {
    super.initState();
    _prefs.then((value) {
      if (value.getString('token') != null) {
        _handleUsers(value.getString('token')!);
      }
    });
  }

  Future<void> _handleUsers(String accessToken) async {
    const url = 'http://localhost:4500/users';
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          name = responseData['name'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 30,
        automaticallyImplyLeading: false, // Remove the back button
        title: Text(
          'Welcome Dap-X Progs App',
          style: TextStyle(color: GlobalColors.mainColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10), // Adding space between AppBar and Welcome text
          Text(
            'Login, as $name',
            style: TextStyle(
              color: GlobalColors.mainColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            'assets/images/HomeScreen.png', // Ganti dengan path gambar Anda
            width: 720,
            height: 400,
          ),
          SizedBox(height: 20), // Adding space between Image and IconButton
          IconButton(
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CRUDPage()),
              );
            },
            // Menggunakan widget Row untuk menempatkan ikon di tengah
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.account_circle, color: Colors.white),
                ),
                SizedBox(
                    width: 5), // Menambahkan sedikit jarak antara ikon dan teks
                Text(
                  'Data Pengguna',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
