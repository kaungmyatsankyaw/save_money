import 'package:flutter/material.dart';

class SettingUtility {
  static buildSubTitle({required String title, fontWeight = FontWeight.w400}) {
    return Text(
      title,
      style: TextStyle(fontWeight: fontWeight),
    );
  }

  static buildButton({required String text, required VoidCallback fun,}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade300,
          onPrimary: Colors.black,
        ),
        onPressed: fun,
        child: Text(text));
  }
}
