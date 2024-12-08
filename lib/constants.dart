import 'package:flutter/material.dart';

Widget myFormFeild({
  required TextEditingController controller,
  required IconData iconData,
  required String label,
  required TextInputType type,
}) =>
    TextFormField(
      keyboardType: type,
      controller: controller,
      validator: (input) {
        if (controller.text.isEmpty) {
          return 'User name most to be empty';
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
