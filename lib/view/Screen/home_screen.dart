import 'package:flutter/material.dart';
import 'package:flutter_auth/view/Screen/global.colors.dart'; // Pastikan path benar
import 'crudpage.dart'; // Pastikan import halaman CRUD yang benar

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
            'Login, as Daptzy',
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
                SizedBox(width: 5), // Menambahkan sedikit jarak antara ikon dan teks
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
