import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal({
    super.key,
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure, required Null Function(dynamic value) onChanged, required String? Function(dynamic value) validator,
  });

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.1),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Colors.black,
            blurRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
          hintStyle: const TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}
