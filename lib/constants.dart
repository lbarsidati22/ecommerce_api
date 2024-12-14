import 'package:flutter/material.dart';

const mainBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
const bodyBackgroundColor = Color.fromRGBO(32, 33, 36, 1);
const primaryColor = Colors.white;
const secondaryColor = Color.fromARGB(166, 158, 158, 158);

String? testToken;
String? token;
const mainColor = Color(0xff222233);
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
