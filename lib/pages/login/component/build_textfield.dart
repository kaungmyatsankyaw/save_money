// Build TextFiled
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final IconData iconData;
  final TextEditingController controller;
  final TextInputType inputType;
  final String labelText;
  final String hintText;

  BuildTextField(
      {required this.labelText,
      required this.hintText,
      required this.controller,
      required this.iconData,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
          focusColor: Colors.blueGrey,
          prefixIcon: Icon(iconData)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please  $labelText';
        }
        return null;
      },
    );
  }
}
