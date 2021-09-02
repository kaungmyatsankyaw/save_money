import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String username;
  final String email;
  final String phone;

  UserInfo({required this.username, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserInfoText(text: username),
          UserInfoText(text: email),
          UserInfoText(text: phone)
        ],
      ),
    );
  }
}

class UserInfoText extends StatelessWidget {
  final String text;
  UserInfoText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
