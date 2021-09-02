import 'package:app/controllers/news_controller.dart';
import 'package:app/data_model/tab_bar_model.dart';
import 'package:app/pages/component/tabbar_component.dart';
import 'package:app/pages/news/component/head_line.dart';
import 'package:app/pages/news/component/source.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class News extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return TabBarComponent(title: 'News', tabBarView: [
      HeadLine(),
      Sources()
    ], tabBar: [
      TabBarModel(title: 'News', iconData: FontAwesomeIcons.newspaper),
      TabBarModel(title: 'Sources', iconData: FontAwesomeIcons.sourcetree),
    ]);
  }
}
