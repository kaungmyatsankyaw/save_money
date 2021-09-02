import 'package:app/pages/home/component/general/user_info.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'circle_avatar.dart';

class UserSection extends StatelessWidget {
  final LoginUser user;

  UserSection({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomCircelAvatar(imageUrl: user.profileUrl),
          Container(
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.only(left:10),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 0.3, color: Colors.blueGrey))),
              child: UserInfo(
                username: user.username,
                email: user.email,
                phone: user.phoneNumber,
              ))
        ],
      ),
    );
  }
}
