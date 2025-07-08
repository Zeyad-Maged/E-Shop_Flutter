import 'package:flutter/material.dart';

class text_field extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final bool obscureText;
  final TextInputType type;

  const text_field({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.type,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) return "Please enter valid text";
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}