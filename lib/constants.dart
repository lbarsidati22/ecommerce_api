import 'package:flutter/material.dart';

Widget myFormFeild({
  required TextEditingController controller,
  required IconData iconData,
  required String label,
  required TextInputType type,
  required String hintText,
  bool? isSecoure,
}) =>
    TextFormField(
      obscureText: isSecoure ?? false,
      keyboardType: type,
      controller: controller,
      validator: (input) {
        if (controller.text.isEmpty) {
          return '$hintText most to be empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        label: Text(label),
        suffixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
