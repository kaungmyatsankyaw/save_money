import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String buttonText;
  final String titleText;

  final bool showBtn;
  final String routeName;
  final IconData iconData;
  final bool centerTitle;
  final bool showBackIcon;

  Size get preferredSize => const Size.fromHeight(60);

  NormalAppBar(
      {required this.titleText,
      required this.buttonText,
      this.showBtn = true,
      this.routeName = '',
      this.iconData = FontAwesomeIcons.plusSquare,
      this.centerTitle = false,
      this.showBackIcon = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackIcon,
      centerTitle: centerTitle,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Text(titleText,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: showBtn == true
              ? Container(
                  child: getButton(
                      routeName: routeName,
                      iconData: iconData,
                      buttonText: buttonText))
              : null,
        )
      ],
    );
  }

  static getButton(
      {required routeName, required iconData, required buttonText}) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Colors.white, shadowColor: Colors.blueGrey),
        onPressed: () {
          Get.toNamed(routeName);
        },
        icon: FaIcon(
          iconData,
          color: Colors.black,
        ),
        label: Text(
          buttonText,
          style: TextStyle(color: Colors.black),
        ));
  }
}
