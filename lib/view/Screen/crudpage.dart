import 'package:flutter/material.dart';
import 'package:flutter_auth/app/constant/global.colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CRUDPage extends StatefulWidget {
  @override
  _CRUDPageState createState() => _CRUDPageState();
}

class _CRUDPageState extends State {
  final List<Map<String, dynamic>> _items = [];

  void _addItem() {
    setState(() {
      _items.add({
        'name': '',
        'address': '',
        'city': '',
        'hobby': '',
        'religion': '',
        'image': null, // Added image field
      });
    });
  }

  void _editItem(int index) {
    setState(() {
      _items[index] = {
        'name': 'New Name',
        'address': 'New Address',
        'city': 'New City',
        'hobby': 'New Hobby',
        'religion': 'New Religion',
        'image': _items[index]['image'], // Retain existing image
      };
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  Future<void> _getImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Changed from getImage to pickImage
    setState(() {
      if (pickedFile != null) {
        _items[index]['image'] = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DAP-X CRUD PAGE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: GlobalColors.mainColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                initialValue: _items[index]['name'],
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  icon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  _items[index]['name'] = value;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: _items[index]['address'],
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your address',
                  icon: Icon(Icons.location_on),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  _items[index]['address'] = value;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: _items[index]['city'],
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter your city',
                  icon: const Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  _items[index]['city'] = value;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: _items[index]['hobby'],
                decoration: InputDecoration(
                  labelText: 'Hobby',
                  hintText: 'Enter your hobby',
                  icon: const Icon(Icons.sports),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  _items[index]['hobby'] = value;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: _items[index]['religion'],
                decoration: InputDecoration(
                  labelText: 'Religion',
                  hintText: 'Enter your religion',
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  _items[index]['religion'] = value;
                },
              ),
              const SizedBox(height: 10),
              _items[index]['image'] != null
                  ? Image.file(
                      _items[index]['image'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Container(), // Show image if available
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _getImage(index); // Call image picker
                },
                child: const Text('Pick Image'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: GlobalColors.mainColor, // Menyesuaikan warna teks dengan warna tombol tambah
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _editItem(index),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: GlobalColors.mainColor, // Menyesuaikan warna teks dengan warna tombol tambah
                    ),
                    child: const Text('Edit'),
                  ),
                  ElevatedButton(
                    onPressed: () => _deleteItem(index),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: GlobalColors.mainColor, // Menyesuaikan warna teks dengan warna tombol tambah
                    ),
                    child: const Text('Delete'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: GlobalColors.mainColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
