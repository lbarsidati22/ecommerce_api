import 'package:flutter/material.dart';

Widget testFormFaild({
  required TextEditingController controller,
  required IconData icon,
  required String hintText,
  required String label,
}) =>
    TextFormField(
      controller: controller,
      validator: (_) {
        if (controller.text.isEmpty) {
          return '$hintText required';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: Icon(icon),
      ),
    );
