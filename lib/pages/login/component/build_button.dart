import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildButton extends StatelessWidget {
  final formKey;
  final bool isSubmit;
  final ButtonStyle buttonStyle;
  final String btnText;

  BuildButton(
      {required this.btnText,
      required this.formKey,
      this.isSubmit = true,
      required this.buttonStyle});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        if (isSubmit) {
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
          }
        } else
          Get.back();
      },
      child: Text(btnText),
    );
  }
}
