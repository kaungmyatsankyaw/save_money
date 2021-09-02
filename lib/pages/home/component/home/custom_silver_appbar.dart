import 'package:app/pages/home/component/general/circle_avatar.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 5,
      backgroundColor: Colors.white,
      title: Text(
        'Hello ',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        Consumer<AuthProvider>(builder: (_, prov, wz) {
          LoginUser user = prov.getUser;
          return user.isLogin == true
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCircelAvatar(
                    radius: 20,
                    imageUrl: user.profileUrl,
                  ))
              : Container();
        })
      ],
      pinned: true,
      snap: false,
      floating: true,
    );
  }
}
