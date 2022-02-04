import 'package:flutter/material.dart';

class InputFieldText extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final String label;
  final IconData? icon;

  InputFieldText({required this.controller, required this.hint, required this.label, this.icon,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        maxLength: 24,
        style: TextStyle(
            fontSize: 24
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}