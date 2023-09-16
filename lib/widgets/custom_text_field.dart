import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final InputDecoration decoration;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.decoration,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: TextField(
        controller: controller,
        decoration: decoration,
      ),
    );
  }
}
