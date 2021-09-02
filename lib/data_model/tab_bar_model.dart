import 'package:flutter/material.dart';

class TabBarModel {
  final String title;
  final IconData iconData;
  final String type;
  TabBarModel({required this.title, required this.iconData, this.type = ''});
}
